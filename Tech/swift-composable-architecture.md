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

## Stack Point

* ```swift
  .ifLet(\.$destination, action: /Action.destination) {
      Destination()
  }
  ```

  これのつけ忘れで、

  `To fix this, invoke "BindingReducer()" from your feature reducer's "body".` が発生しバインディングがうまくいかず、どこ直せばいいか分からずスタックした。
