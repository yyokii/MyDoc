## [README](https://github.com/pointfreeco/swift-composable-architecture/blob/main/README.md)

### Basic Usage

Composable Architectureを使用して機能を構築するには、ドメインをモデル化するいくつかの型と値を定義します。
* State: 機能がロジックを実行し、UIをレンダリングするために必要なデータを記述するタイプ。
* Action: ユーザーアクション、通知、イベントソースなど、機能で発生する可能性のあるすべてのアクションを表すタイプ。
* Reducer: アクションが起き、次の状態にアプリの状態を変化させる方法を記述する関数。Reducerは、Effect値を返すことによってAPI要求など、実行されるすべきeffectを返す責務もあります。
* Store: 実際にあなたの機能を稼働させるランタイム。ストアがReducer とeffectsを実行できるように、すべてのユーザーアクションをストアに送信し、ストアの状態の変化を見てUIを更新できます。
この利点は、機能のテスト可能性を向上させ、大きくて複雑な機能を結合可能な小さなドメインに分割できることです。
基本的な例として、数字をインクリメントおよび減少させる「+」ボタンと「-」ボタンとともに数字を表示するUIを考えてみましょう。ひと手間加えて、ボタンを追加しそれをタップすると、APIリクエストを行い、その数に関するランダムな豆知識を取得し、アラートにそれを表示するとします。
この機能を実装するには、Reducerに準拠し、機能のドメインと振る舞いを格納する新しいタイプを作成します。

``` .swift
import ComposableArchitecture

struct Feature: Reducer {
}
```

まず、現在のカウントの整数と、表示したいアラートのタイトルを表すオプションの文字列で構成される機能の状態を表す型を定義する必要があります（nilはアラートを表示しないことを表すため、optional 型です）。

``` .swift
struct Feature: Reducer {
  struct State: Equatable {
    var count = 0
    var numberFactAlert: String?
  }
}
```

また、機能のアクションを表す型を定義する必要があります。デクリメントボタン、インクリメントボタン、豆知識ボタンをタップするなど、明確なアクションがあります。しかし、アラートを却下するユーザーのアクションや、豆知識取得APIリクエストから応答を受け取ったときに発生するアクションなど、少し明白ではないものもあります。

``` .swift
struct Feature: Reducer {
  struct State: Equatable { /* ... */ }
  enum Action: Equatable {
    case factAlertDismissed
    case decrementButtonTapped
    case incrementButtonTapped
    case numberFactButtonTapped
    case numberFactResponse(String)
  }
}
```

そして、機能の実際のロジックと動作を管理する責務を負うreduce方法を実装します。現在の状態を次の状態に変更する方法と、実行する必要があるエフェクトについて記述します。一部のアクションはエフェクトを実行する必要はなく、それを表すために.noneを返すことが可能です。

``` .swift
struct Feature: Reducer {
  struct State: Equatable { /* ... */ }
  enum Action: Equatable { /* ... */ }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .factAlertDismissed:
      state.numberFactAlert = nil
      return .none

    case .decrementButtonTapped:
      state.count -= 1
      return .none

    case .incrementButtonTapped:
      state.count += 1
      return .none

    case .numberFactButtonTapped:
      return .run { [count = state.count] send in
        let (data, _) = try await URLSession.shared.data(
          from: URL(string: "http://numbersapi.com/\(count)/trivia")!
        )
        await send(
          .numberFactResponse(String(decoding: data, as: UTF8.self))
        )
      }

    case let .numberFactResponse(fact):
      state.numberFactAlert = fact
      return .none
    }
  }
}

```

そして最後に、機能を表示するビューを定義します。StoreOf<Feature>を保持して、状態のすべての変更を捕捉し再レンダリングし、ユーザーアクションをストアに送り状態の変更ができます。また、.alert view modifier で利用するため、fact alert をstructにしIdentifiableにする必要があります。

``` .swift
struct FeatureView: View {
  let store: StoreOf<Feature>

  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        HStack {
          Button("−") { viewStore.send(.decrementButtonTapped) }
          Text("\(viewStore.count)")
          Button("+") { viewStore.send(.incrementButtonTapped) }
        }

        Button("Number fact") { viewStore.send(.numberFactButtonTapped) }
      }
      .alert(
        item: viewStore.binding(
          get: { $0.numberFactAlert.map(FactAlert.init(title:)) },
          send: .factAlertDismissed
        ),
        content: { Alert(title: Text($0.title)) }
      )
    }
  }
}

struct FactAlert: Identifiable {
  var title: String
  var id: String { self.title }
}

```

また、UIKitコントローラーをこのストアから駆動させるのも簡単です。UIを更新してアラートを表示するために、viewDidLoadでストアを購読します。

``` .swift
class FeatureViewController: UIViewController {
  let viewStore: ViewStoreOf<Feature>
  var cancellables: Set<AnyCancellable> = []

  init(store: StoreOf<Feature>) {
    self.viewStore = ViewStore(store, observe: { $0 })
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let countLabel = UILabel()
    let incrementButton = UIButton()
    let decrementButton = UIButton()
    let factButton = UIButton()

    // Omitted: Add subviews and set up constraints...

    self.viewStore.publisher
      .map { "\($0.count)" }
      .assign(to: \.text, on: countLabel)
      .store(in: &self.cancellables)

    self.viewStore.publisher.numberFactAlert
      .sink { [weak self] numberFactAlert in
        let alertController = UIAlertController(
          title: numberFactAlert, message: nil, preferredStyle: .alert
        )
        alertController.addAction(
          UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _ in self?.viewStore.send(.factAlertDismissed) }
          )
        )
        self?.present(alertController, animated: true, completion: nil)
      }
      .store(in: &self.cancellables)
  }

  @objc private func incrementButtonTapped() {
    self.viewStore.send(.incrementButtonTapped)
  }
  @objc private func decrementButtonTapped() {
    self.viewStore.send(.decrementButtonTapped)
  }
  @objc private func factButtonTapped() {
    self.viewStore.send(.numberFactButtonTapped)
  }
}

```

アプリのエントリポイントなど、このビューを表示する準備ができたら、ストアを構築できます。これは、アプリケーションの初期状態と、アプリケーションを動かすreducerを指定することで完了します。

``` .swift
import ComposableArchitecture

@main
struct MyApp: App {
  var body: some Scene {
    WindowGroup {
      FeatureView(
        store: Store(initialState: Feature.State()) {
          Feature()
        }
      )
    }
  }
}

```

これらは実際に動かしてみるのに十分です。バニラSwiftUIの方法でこれを行う場合よりも間違いなく工程は多いですが、いくつかの利点があります。いくつかのobservable objectやUIコンポーネントのさまざまなアクションクロージャでロジックを散乱させるのではなく、状態を変更する一貫した方法を提供します。また、副作用を表現する簡潔な方法も提供します。そして、多くの追加作業をすることなく、effectを含むこのロジックをすぐにテストできます。

### Test

テストするには、Storeと同じ情報で作成できるTestStoreを使用します。そして、アクションが送信されると機能がどのように変化するかを定義するための追加作業を行います。

``` .swift
@MainActor
func testFeature() async {
  let store = TestStore(initialState: Feature.State()) {
    Feature()
  }
}

```

テストストアが作成されたら、それを使用してユーザーフロー全体の各ステップにおけるアサーションを行うことができます。各段階で、私たちが期待するように状態が変化したことを確認する必要があります。たとえば、インクリメントボタンとデクリメントボタンをタップするユーザーフローをシミュレートできます。

``` .swift
// Test that tapping on the increment/decrement buttons changes the count
await store.send(.incrementButtonTapped) {
  $0.count = 1
}
await store.send(.decrementButtonTapped) {
  $0.count = 0
}

```

さらに、effectが実行されデータをストアに送り返す場合、それをアサートする必要があります。たとえば、ユーザーがファクトボタンをタップすることをシミュレートすると、ファクト付きのファクト応答が返されることを期待し、そしてアラートが表示されます。

``` .swift
await store.send(.numberFactButtonTapped)

await store.receive(.numberFactResponse(???)) {
  $0.numberFactAlert = ???
}

```

しかし、どのような豆知識が送り返されるかをどうやって知ることができますか?
現在reducerは、APIサーバーを利用するためにリアルのそれと接続するeffectを使用しており、その動作を制御する方法がないです。このテストを書くとなると、インターネット接続とAPIサーバーの可用性の気まぐれに左右されてしまいます。
デバイスでアプリケーションを実行するときにlive依存関係を使用できるように、この依存関係をreducerに渡せる方が良いでしょう。一方で、テストではモックされた依存関係を使用できます。Featureにプロパティを追加することで、これを行うことができます。

``` .swift
struct Feature: Reducer {
  let numberFact: (Int) async throws -> String
  // ...
}

```

reduceでの実装は次のようになります

``` .swift
case .numberFactButtonTapped:
  return .run { [count = state.count] send in 
    let fact = try await self.numberFact(count)
    await send(.numberFactResponse(fact))
  }

```

アプリケーションのエントリポイントでは、実際にリアルなAPIサーバーと通信する依存関係のものを提供できます。

``` .swift
@main
struct MyApp: App {
  var body: some Scene {
    FeatureView(
      store: Store(initialState: Feature.State()) {
        Feature(
          numberFact: { number in
            let (data, _) = try await URLSession.shared.data(
              from: URL(string: "http://numbersapi.com/\(number)")!
            )
            return String(decoding: data, as: UTF8.self)
          }
        )
      }
    )
  }
}

```

テストでは、決定論的で予測可能な豆知識をすぐに返すモックを使用できます。

``` .swift
@MainActor
func testFeature() async {
  let store = TestStore(initialState: Feature.State()) {
    Feature(numberFact: { "\($0) is a good number Brent" })
  }
}

```

その少し作業で、ユーザーがファクトボタンをタップするのをシミュレートし、依存関係から応答を受け取りアラートをトリガーし、アラートを閉じることで、テストを行えます。

``` .swift
await store.send(.numberFactButtonTapped)

await store.receive(.numberFactResponse("0 is a good number Brent")) {
  $0.numberFactAlert = "0 is a good number Brent"
}

await store.send(.factAlertDismissed) {
  $0.numberFactAlert = nil
}

```

また、アプリケーションでnumberFact依存関係を使用するエルゴノミクスをもう少し良くすることもできまふ。時間が経つにつれて、アプリケーションは多くの機能を持つようになり、それらの機能のいくつかはnumberFactにアクセスしたいと思うかもしれませんし、すべてのレイヤーを明示的に渡すのは煩雑になる可能性があります。ライブラリとの依存関係を「登録」するためのプロセスがあり、これによりアプリケーション内の任意のレイヤーで即座に利用できるようになります。

numberFact機能を新しいタイプにラップすることから始めることができます。

``` .swift
struct NumberFactClient {
  var fetch: (Int) async throws -> String
}

```

そして、クライアントをDependencyKeyプロトコルに適合させることで、そのタイプを依存関係管理システムに登録します。これにより、シミュレータまたはデバイスでアプリケーションを実行するときに使用するライブ値の設定が必要となります。

``` .swift
extension NumberFactClient: DependencyKey {
  static let liveValue = Self(
    fetch: { number in
      let (data, _) = try await URLSession.shared
        .data(from: URL(string: "http://numbersapi.com/\(number)")!
      )
      return String(decoding: data, as: UTF8.self)
    }
  )
}

extension DependencyValues {
  var numberFact: NumberFactClient {
    get { self[NumberFactClient.self] }
    set { self[NumberFactClient.self] = newValue }
  }
}

```

これらの対応により、@Dependencyプロパティラッパーを使用して、任意の機能の依存関係をすぐに利用できます。

``` .swift
 struct Feature: Reducer {
-  let numberFact: (Int) async throws -> String
+  @Dependency(\.numberFact) var numberFact
   
   …

-  try await self.numberFact(count)
+  try await self.numberFact.fetch(count)
 }

```

このコードは以前と同じように機能しますが、機能のレデューサーを構築するときに依存関係を明示的に渡す必要がなくなりました。プレビュー、シミュレータ、またはデバイスでアプリを実行すると、ライブ依存関係がレデューサーに提供され、テストではテスト用の依存関係が提供されます。
これは、アプリケーションへのエントリポイントが依存関係を構築する必要がなくなったことを意味します。

``` .swift
@main
struct MyApp: App {
  var body: some Scene {
    FeatureView(
      store: Store(initialState: Feature.State()) {
        Feature()
      }
    )
  }
}

```

また、テストストアは依存関係を指定せずに構築できますが、テストの目的のために必要な依存関係をオーバーライドすることも可能です。

``` .swift
let store = TestStore(initialState: Feature.State()) {
  Feature()
} withDependencies: {
  $0.numberFact.fetch = { "\($0) is a good number Brent" }
}

// ...

```

これらは、Composable Architectureの機能の構築とテストの基本です。コンポジション、モジュール性、適応性、複雑なeffectなど、探求すべきことがたくさんあります。Examplesディレクトリには、より高度な使用法を見るために探索するプロジェクトがたくさんあります。

## [ComposableArchitecture | Documentation](https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture)



## [Identified Collections](https://www.pointfree.co/blog/posts/60-open-sourcing-identified-collections)

### 課題

以下のような `TODO` を管理するアプリケーションを考える。

```swift
struct Todo: Identifiable {
  var description = ""
  let id: UUID
  var isComplete = false
}
```

view model にその配列を以下のように保持できる。

```swift
class TodosViewModel: ObservableObject {
    @Published var todos: [Todo] = []
}
```

View においてTODOのリストを表示し、アクションをした場合にAPIリクエストしたり、アナリティクスを送信したり、またはユニットテストのために、view model において以下のような func を作成することがある。

```swift
class TodosViewModel: ObservableObject {
  …
  func todoCheckboxToggled(at id: Todo.ID) {
    guard let index = self.todos.firstIndex(where: { $0.id == id })
    else { return }

    self.todos[index].isComplete.toggle()
    // TODO: Update todo on backend using an API client
  }
}
```

idを引数に取る場合、`firstIndex(where:)` を利用する必要があり、そしてこれは `O(n)` である。
https://developer.apple.com/documentation/swift/dictionary/firstindex(where:)

`index: Int` を引数に取るようにすることで `O(1)` でアクセスできるが、

```swift
List(Array(self.viewModel.todos.enumerated()), id: \.element.id) { index, todo in
  …
}
```

* List 部分の記述が増える
* body の評価時に新しい Array が割り当てられる可能性がある。新しい配列を作成することは、パフォーマンスの観点から最適ではない
* view model の func においては、非同期処理をする前に以下のようにしないと意図しないものを更新したり、そもそも存在しない可能性もある

```swift
class TodosViewModel: ObservableObject {
  …
  func todoCheckboxToggled(at index: Int) async {
    self.todos[index].isComplete.toggle()

    // 1️⃣ Get a reference to the todo's id before kicking off the async work
    let id = self.todos[index].id

    do {
      // 2️⃣ Update the todo on the backend
      let updatedTodo = try await self.apiClient.updateTodo(self.todos[index])

      // 3️⃣ Find the updated index of the todo after the async work is done
      let updatedIndex = self.todos.firstIndex(where: { $0.id == id })!

      // 4️⃣ Update the correct todo
      self.todos[updatedIndex] = updatedTodo
    } catch {
      // Handle error
    }
  }
}
```



### 解決策

以上のような課題を `IdentifiedArray` で解決できる。

```swift
class TodosViewModel: ObservableObject {
  @Published var todos: IdentifiedArrayOf<Todo> = []
  
  func todoCheckboxToggled(at id: Todo.ID) async {
    self.todos[id: id]?.isComplete.toggle()

    do {
      // 1️⃣ Update todo on backend and mutate it in the todos identified array.
      self.todos[id: id] = try await self.apiClient.updateTodo(self.todos[id: id]!)
    } catch {
      // Handle error
    }

    // No step 2️⃣ 😆
  }
}
```

id による添字でアクセスでき、非同期処理時の `index` がずれる問題もきにしなくてよくなる。



## StoreTaskにおける `finish()`とストリーミング処理

```swift
.task {
    await viewStore.send(.listenGroups).finish()
    await viewStore.send(.listenPersons).finish()
}
```

.listen~はAsyncThrowingStreamを扱う処理を行っている（Firestoreからのデータをlistenしている）。
この場合、上記のようにすると後半のタスクは呼ばれない。

  * 原因

    1. `viewStore.send(.listenGroups)`と`viewStore.send(.listenPersons)`はストリームを開始するため、基本的に完了することはない。Firestoreからデータを継続的にlistenしているため。

    2. `finish()` メソッドはタスクの終了を待つ。 この場合、ストリームが基本的に終わらないため、`finish()`を使用すると、そのタスクは「完了」することがない。

    3. 複数の`await`を一つの`.task`内に置くと、一つ目の`await`が完了するまで二つ目は開始されない。 そのため、一つ目の`await`が終わらず、二つ目は決して実行されない。

  * 解決策

    - `finish()`メソッドを取り除き、並列にタスクを実行させる

      ```swift
      .task {
          await viewStore.send(.listenGroups)
          await viewStore.send(.listenPersons)
      }
      ```
      ここでは、2つの`await`式が並列に実行され、互いにブロックし合うことはない。
      
    - task modifierを分けて、並列にタスクを実行させる

      ```swift
      .task {
          await viewStore.send(.listenGroups).finish()
      }
      .task {
          await viewStore.send(.listenPersons).finish()
      }
      ```

## Storeの初期化の書き方

```
let store = Store(
  initialState: SomeReducer.State(...),
  reducer: { SomeReducer() },
  withDependencies: {
    $0.someDependency = ...
  }
)

or

let store = Store(
  initialState: SomeReducer.State(...)
) {
  SomeReducer()
} withDependencies: {
  $0.someDependency = ...
}

```

* `SomeReducer.State(...)`とすることで補完が効くようになる
* SomeReducerを`trailing closure`を使って書くかどうかは個人的にはどちらでも良いと思った。`closure`が1つのみである場合は`trailing closure`形式で書くのが良いという公式ガイドラインもあった気もする。明示的に引数名ある方がわかりやすさもあるとは思う。[TCAのrepositry](https://github.com/search?q=repo%3Apointfreeco%2Fswift-composable-architecture%20%7D%20withDependencies%3A%20%7B&type=code)では後者の書き方で書いてる。こういうのは公式に則るのが良いとも思うので、どちらかといえば後者かなあと。

参考

[個人的な Effective TCA](https://zenn.dev/kalupas226/articles/5b0bf98c922aa0)

## Stack Point

* ```swift
  .ifLet(\.$destination, action: /Action.destination) {
      Destination()
  }
  ```

  これのつけ忘れで、

  `To fix this, invoke "BindingReducer()" from your feature reducer's "body".` が発生しバインディングがうまくいかず、どこ直せばいいか分からずスタックした。

## Actionの記述をわかりやすくする

Actionは増えてくると読みづらくなる。
また、Actionの種別はある程度分けることが可能である。

[Thoughts on "Action Boundaries" to keep Actions organized and their intent explicit · pointfreeco/swift-composable-architecture · Discussion #1440](https://github.com/pointfreeco/swift-composable-architecture/discussions/1440#discussioncomment-3799435) より下記の`TCAFeatureAction`を利用することで見通しが良くなる。

```swift
public protocol TCAFeatureAction {
    associatedtype ViewAction
    associatedtype DelegateAction
    associatedtype InternalAction

    static func view(_: ViewAction) -> Self
    static func delegate(_: DelegateAction) -> Self
    static func `internal`(_: InternalAction) -> Self
 }
 
 public enum MyFeatureAction: TCAFeatureAction {
   enum ViewAction: Equatable {
      case didAppear
      case toggle(Todo)
      case dismissError
   }

   enum InternalAction: Equatable {
     case listResult(Result<[Todo], TodoError>)
     case toggleResult(Result<Todo, TodoError>)
   }

   enum DelegateAction: Equatable {
     case ignored
   }

  case view(ViewAction)
  case `internal`(InternalAction)
  case delegate(DelegateAction)
}
```

view, delegate, internalの他に下記が考えれる

* 対象機能が他に切り出したReducerを利用している際のAction
  * これは上記のものとは別の意味合いなので、そのまま追記
* 遷移先のAction
  * これも上記のものとは別の意味合い。  `struct Destination: Reducer` を作成し `case destination(PresentationAction<Destination.Action>)` のように記述するのが良さそう

参考

* [TCAFeatureAction で Action を見やすく・安全にしよう](ht tps://zenn.dev/kalupas226/articles/e214cf384a7b84)

## Tips

* store.sendがあるが、ViewStoreがあるときはそっち経由でsendを呼ぶ
  * https://github.com/pointfreeco/swift-composable-architecture/blob/9b0f600253f467f61cbd53f60ccc243cc4ff27cd/Sources/ComposableArchitecture/Store.swift#L192-L196
* [RFC: General tips and tricks · pointfreeco/swift-composable-architecture · Discussion #1666](https://github.com/pointfreeco/swift-composable-architecture/discussions/1666#discussioncomment-4212335) ここを見るとTipsが見つかるかも
  * TestabilityのためにStateやActionをEquatableにするのは大事
    * https://github.com/pointfreeco/swift-composable-architecture/discussions/1666#discussioncomment-4140589
    * 一方で、`ViewStore`の観点からは、全`State`を監視するのではなく、必要な部分の`State`のみを監視することが望ましい。全`State`を監視すると、`State`の不要な変更に対してもビューが更新される可能性があるため、パフォーマンスの問題や不要なビューの再描画が発生する可能性がある。
      * 解決策として、テスト時に`Equatable`プロトコルをつけるなどがある
  * 
