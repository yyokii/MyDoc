## enum vs struct

| **基準**                          | **struct** | **enum** | **理由**                                                                                              |
|-----------------------------------|------------|----------|------------------------------------------------------------------------------------------------------|
| **パターンや属性の数が多い**        | ◎          | △        | `enum` でも可能だが、`struct` の方がコード行数が少なく、パターン毎の属性がわかりやすい。               |
| **状態が1つに限定される**           | △          | ◎        | `struct` でもよいが、`switch` で `default` が必要になるため `enum` の方が適している。`enunm` でパターン列挙しその中に `struct` でそれぞれのプロパティをまとめたものを作成するという方針も可能。                |
| **状態遷移を管理したい**            | ×          | ◎        | 状態遷移: ローディング → 成功 → 失敗 のようなもの。`struct` でも表現可能だが、プロパティでerrorやmessageといったものを保持する場合にそれらの意図しない組み合わせが発生する可能性があり不適（例: successだがerrorがある）。                              |
| **拡張性が重要**                  | ◎          | △        | `struct` はパターンを後から追加する際に楽。`enum` の場合すべてのプロパティに修正が必要。               |
| **異なる型の値を状態ごとに持たせたい** | ×          | ◎        | `enum` は `Associated Value` を用いて状態ごとに異なる型のデータを保持可能。                          |

* https://zenn.dev/d_date/articles/964dd9c79e3d63
* https://zenn.dev/matsuji/articles/1461b0ac90c95f

## TaskのSleep

https://developer.apple.com/documentation/swift/task/sleep(for:tolerance:clock:)

> This function doesn’t block the underlying thread.

ブロックしないので、Task.sleep(for:) は指定された時間を待つ間スレッドを実際には停止せず、そのスレッドは他のタスクを処理できる状態のまま。
したがってブロック懸念で別のスレッドで実行する必要はない。

## randomな値の生成について

.random 系のメソッドはデフォルトでは「system’s default random generator」を使用していると記載されている。

* https://developer.apple.com/documentation/swift/int/random(in:)-9mjpw
* https://developer.apple.com/documentation/swift/array/randomelement()

SystemRandomNumberGenerator は、基盤となるオペレーティングシステム（OS）が提供する乱数生成器を使用する。
つまり、暗号論的に安全な乱数生成器が OS によって提供されている場合それが使用される。しかし、全てのプラットフォームで暗号論的に安全な乱数生成器が利用可能であるとは限らない。

> Apple platforms use arc4random_buf(3).
> 
> Linux platforms use getrandom(2) when available; otherwise, they read from /dev/urandom.
> 
> Windows uses BCryptGenRandom.

https://developer.apple.com/documentation/swift/systemrandomnumbergenerator

Foundation の実装なので、動的リンクされておりつまり実装がアプリ開発者の知らないところで発生する可能性はある。
が、ドキュメントに暗号論的に安全であることを保証するとあるのでそれを信頼するで良いと思う。

* Appleプラットフォーム限定のアプリケーションの場合:

SystemRandomNumberGeneratorやUInt8.random(in:)を使用しても問題ない。
コードがシンプルになり、可読性が向上する。

* クロスプラットフォームを考慮する場合:
  
暗号論的に安全な乱数が必要な場合、プラットフォームに依存しない方法で乱数を生成する必要がある。
例えば、SecRandomCopyBytesを使用するか、暗号論的に安全な乱数生成器を提供するライブラリを使用することを検討する。

* セキュリティ要件が非常に高い場合:

リスクを完全に排除したい場合は、SecRandomCopyBytesを使用して使用する乱数生成器を明示的に指定することが望ましい。

https://forums.swift.org/t/random-data-uint8-random-or-secrandomcopybytes/56165/12

## precondigion と assert

### assert

* デバッグ時に問題を見つけたい場合 = 必ず満たされるべき内部的な条件のチェック
* リリースビルドでは条件チェックを不要にしたい場合。

### precondition:

* リリースビルドでも必須条件を保証したい場合。
* 条件を満たさないとアプリが正しく動作しない場合。

https://qiita.com/koher/items/ca7f388ab2a4e6747339

## ExpressibleByStringLiteral

Stringリテラルで初期化したからといって、Stringになるとはかぎらない。

```.swift
struct MyString: ExpressibleByStringLiteral {
    let value: String

    // 必要なイニシャライザを実装
    init(stringLiteral value: String) {
        self.value = value
    }
}

// 文字列リテラルで初期化
let greeting: MyString = "こんにちは、世界！"
print(greeting.value) // 出力: こんにちは、世界！
```

* ExpressibleByStringLiteralに準拠することで、文字列リテラルを使ってカスタム型のインスタンスを生成できる
* 必要なイニシャライザinit(stringLiteral:)を実装する必要がある

## スタックメモリとヒープメモリ

| 特徴                  | スタックメモリ                                      | ヒープメモリ                                        |
|----------------------|-------------------------------------------------|-------------------------------------------------|
| メモリ割り当てのタイミング    | コンパイル時にのみ発生                              | 実行時に動的に発生                                  |
| メモリ管理の方式          | LIFO（後入れ先出し）方式                            | ダイナミック割り当て                                |
| アクセス速度            | 非常に高速                                         | 比較的遅い                                         |
| データの寿命            | 関数が終了すると自動的に割り当て解除                   | 手動で解放または参照がなくなるまで残る                  |
| メモリサイズ            | 限定されている                                       | 制限なし                                           |
| スレッドセーフ          | 各スレッドには独自のスタックあり                       | スレッドの安全性が必要                               |
| メモリの共有            | スレッドごとに独立                                  | 全スレッドと共有                                    |
| 格納されるデータの種類    | 構造体、列挙型などの値型                             | クラス（参照型）                                    |
| 特別な割り当ての条件      | 値型のサイズがコンパイル時に確定、再帰的に含まれない場合 | 値型がコンパイル時にサイズ不定、値型が参照型を保持している場合、値型が参照型によって保持されている場合 |

[Memory management in Swift(Heap, Stack, ARC) | by Manasa M P | Medium](https://manasaprema04.medium.com/memory-management-in-swift-heap-stack-arc-6713ca8b70e1)

memo:  
TCA ではスタックオーバーフローが生じる問題があるが、ヒープメモリを利用することでそれを回避する方法がある。  
[Potential for stack overflow with large app states · pointfreeco/swift-composable-architecture · Discussion #488](https://github.com/pointfreeco/swift-composable-architecture/discussions/488#discussioncomment-591715)

## 数値型とその範囲

|        | 最小値                  | 最大値                  |
| ------ | ----------------------- | ----------------------- |
| Int32  | -2147483648             | 2147483647              |
| Int64  | -9223372036854775808    | 9223372036854775807     |
| UInt32 | 0                       | 4294967295              |
| UInt64 | 0                       | 18446744073709551615    |
| Float  | 1.1754944e-38           | 3.4028235e+38           |
| Double | 2.2250738585072014e-308 | 1.7976931348623157e+308 |

## protocol

### associatedtypeをもつprotocolはジェネリクスの制約としてのみ利用可能

これは例えばそのようなprotocolをプロパティの型制約として使用した際に`protocol can only be used as a generic constraint because it has Self or associated type requirements` というエラーが出ることからもわかる。

associatedtypeを使用する場合、そのprotocolを利用した型が確定するまでassociatedtypeの具体的な値は不明。そのためその型を宣言するためには、associatedtypeに対して型制約を指定する必要があるが、プロパティへの型制約などではそれが確定しないので「ジェネリクスの制約としてのみ利用可能」となる。

associatedtypeやSelfを利用したprotocolとしては`View`や`Equatable`, `Identifiable`などがある。

[How to fix the error “protocol can only be used as a generic constraint because it has Self or associated type requirements” - free Swift 5.4 example code and tips](https://www.hackingwithswift.com/example-code/language/how-to-fix-the-error-protocol-can-only-be-used-as-a-generic-constraint-because-it-has-self-or-associated-type-requirements)

## Swift Concurrnecy

> * `Task.detached` は `Task.init` と違って優先度 / task local values / actor context を受け継がないという性質がある
>
> - `Task.detached` は処理をメインスレッドから逃すために使われることがあるが、 async 関数はあえて main actor に isolate しない限り必ずバックグラウンドで実行されるため、ほとんどの場面ではこの用途で `Task.detached` を使う必要はない

```swift
func someSuperHeavyComputation() {
  // sync 関数なので呼び出し元のスレッドで実行される
  // すごく重い計算を行うので、メインスレッドから呼び出されると
  // メインスレッドを占有して UI のレスポンスに問題が発生する
}

final class MyViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    Task {
      await someAsyncFunction() // 中身がバックグラウンドスレッドで実行される
      someSuperHeavyComputation() // ❗️ 中身がメインスレッドで実行開始されてしまう
    }
    
    Task.detached {
      await someAsyncFunction() // 中身がバックグラウンドスレッドで実行される
      someSuperHeavyComputation() // ✅ 中身がバックグラウンドスレッドで実行開始される
    }
  }
}
```

これは`someSuperHeavyComputation` をバックグラウンドスレッドにしたいケースである。
こういう場合においてわざわざ諸々を引き継がないということを受け入れて `Task.detached` で書く意味はあまりないので、`someSuperHeavyComputation` を async にしてバックグラウンド実行するのが基本良さそう。

[[swift] メインスレッドから処理を逃すために Task.detached を使う必要はない（ことが多い）](https://zenn.dev/mayaa/articles/792297c2a47935)

## Keypath

任意の型のプロパティへの参照を表す。プロパティを直接操作する代わりに、そのプロパティへのパスを使用して操作を行うことが可能になる。

例えば、複数の型の特定のプロパティを示すことができる。
https://zenn.dev/ueshun/articles/8c968b0fcda506

[What is a KeyPath in Swift | Sarunw](https://sarunw.com/posts/what-is-keypath-in-swift/#key-paths-as-functions)

### 種類

| クラス名                 | Writable    | 型の指定    |
| ------------------------ | ----------- | ----------- |
| AnyKeyPath               | No          | なし        |
| PartialKeyPath           | No          | Root        |
| KeyPath                  | No          | Root, Value |
| WritableKeyPath          | Yes(値型)   | Root, Value |
| ReferenceWritableKeyPath | Yes(参照型) | Root, Value |

[SwiftのKeyPathについて調べた | DevelopersIO](https://dev.classmethod.jp/articles/swift_keypath1/)

### デモ

```swift
struct User {
    var name: String
    var age: Int
}

var user: User = .init(name: "Swift", age: 8)

let keyPath: WritableKeyPath<User, Int> = \.age
let keyPath2 = \User.age
print(user[keyPath: keyPath])

user[keyPath: keyPath] = 9
print(user[keyPath: keyPath])

var userGroups: [String: [User]] = ["id0": [user]]
print(userGroups["id0"]?[0].age as Any)

// 複雑なアクセスをKeyPath化することで名前を付けたり、再利用が可能になる
let keyPath3: KeyPath<[String: [User]], Int?> = \.["id0"]?[0].age
print(userGroups[keyPath: keyPath3] as Any)
```

## Opaque Result Type

Swift 5.1 で導入（([SE-0244](https://github.com/apple/swift-evolution/blob/master/proposals/0244-opaque-result-types.md)）された。
'リバースジェネリクス' を実現するシンタックスシュガー。

例として以下を考える。

```swift
protocol Animal {
    func foo()
}

struct Cat: Animal {
    func foo() { print("cat") }
}
```

この時に、`makeAnimal`の戻り値の型である `some Animal` のような型が Opaque Result Type。

```swift
func makeAnimal() -> some Animal { // この `some` が新しい
    return Cat()
}

let animal = makeAnimal()
animal.foo() // "cat" と表示される
```

`some` という新しい言語機能を導入しなくても、 `-> some Animal` の代わりに `-> Cat` や `-> Animal` とすれば既存の言語機能で同じようなことが実現できる。

が、

1. **`-> Cat` では、内部実装を過剰に公開している**
2. **`-> Animal` では、パフォーマンス上のロスが発生する**

という問題があり、これを解決するために **内部実装を隠蔽しながらパフォーマンスにも影響しない手段として Opaque Result Type が提案された。**

＜ 1 について＞

`makeAnimal`の利用者は `Animal`であることが知れれば良いというケースでより具体的な`Cat`型を公開しているので問題である。

＜ 2 について＞

`Animal` はプロトコルなので、この関数はプロトコル型の値を返すことになる。 Swift ではプロトコル型は Existential Type とも呼ばれる。 Existential Type には実行時のオーバーヘッドがあり、 Swift の標準ライブラリでは Existential Type はほとんど使われていない（ `AnySequence` などの Type Erasure や `Any` を除く）。

たとえば、次のようなコードを考える。

```swift
var animal: Animal = Cat()
animal = Dog()
```

`animal` は `Animal` 型の変数なので、 `Cat` と `Dog` の両方が代入できても何もおかしなことはないように感じられるかもしれない。しかし、 `Cat` と `Dog` の実装が次のようになっていると・・・

```swift
struct Cat: Animal {
    var a: UInt8 = 42
}
struct Dog: Animal {
    var b: Int64 = -1
}
```

この場合、 `Cat` を変数／定数に格納するには 1 バイト、 `Dog` を格納するには 8 バイトの領域を必要とする。

```swift
let cat: Cat = Cat()
MemoryLayout.size(ofValue: cat) // 1

let dog: Dog = Dog()
MemoryLayout.size(ofValue: dog) // 8
```

では、この両方を格納できる `Animal` 型の変数／定数には何バイトの領域が必要か？

```swift
var animal: Animal = Cat()
MemoryLayout.size(ofValue: animal) // 40
```

40 バイトもの領域が必要になる。これは、 `Animal` に適合したどのような型のインスタンスでも格納できるように、 Existential Container という入れ物に包まれているからである。

**Existential Type を使うと、引数に渡すときに Existential Container に包むオーバーヘッドが発生し、メソッドを呼ぶときには Existential Container を開いて間接的にメソッドを呼び出すオーバーヘッドが発生する。**

このような Existential Type のオーバーヘッドをジェネリクスで解決することができる。

```swift
// Existential Type
func useAnimal(_ animal: Animal) { animal.foo() }

// ジェネリクス
func useAnimal<A: Animal>(_ animal: A) { animal.foo() }
```

この時、ジェネリクスは下記のようなオーバーロードをまとめて書くものだと考えるとわかりやすい。

```swift
func useAnimal(_ animal: Cat) { animal.foo() }
func useAnimal(_ animal: Dog) { animal.foo() }
```

Swift では、 Specialization という最適化が行われた場合、ジェネリクスで書かれた `useAnimal` は、個別の型に対して書かれた `useAnimal` と同等のパフォーマンスを実現することができる。 Specialization が行われると、型パラメータに対して具体的な型を埋めたもの（上記の例では `A` に `Cat` や `Dog` を埋めたもの）がコンパイル時に生成される。 `useAnimal(Cat())` はまるで `func useAnimal(_ animal: Cat)` が存在するかのように振る舞う。 **Specialization が行われた場合、ジェネリクスには Existential Type と違って実行時のオーバーヘッドがない。**

以上のようにジェネリクスを使えば Existential Type の問題を解決できるケースがあるが、それは引数の話であった。

```swift
// ジェネリクス
func makeAnimal<A: Animal>() -> A {
    return Cat() // コンパイルエラー
}
```

ジェネリクスの型パラメータを決めるのはその API の利用者である。にも関わらず ↑ のコードは `makeAnimal` の実装自体が `A` を `Cat` と仮定してしまっている。戻り値のジェネリクスは Swift でサポートされていますが、上記のコードは利用者ではなく実装者が型を決定しようとしているので型エラーでコンパイルに失敗する。

今やりたいのは、 `-> Cat` とした場合と同じパフォーマンスを実現しながら、 `-> Animal` とした場合と同じように具体的な型を隠蔽したいということである。そのためには、ジェネリクスとは異なる概念が必要になる。

その概念を「リバースジェネリクス」と呼び、ジェネリクスとの対比を考える。

```swift
// ジェネリクス
func useAnimal<A: Animal>(_ animal: A) {
    animal.foo()
}

// 『リバースジェネリクス』
func makeAnimal() -> <A: Animal> A {
    return Cat()
}
```

これらを比較すると次のような裏返し（双対）の関係にある。

- `useAnimal` の **利用者** が `A` の具体的な型を定め、 `useAnimal` の **実装者** は抽象的な `A` に対してコードを書く。
- `makeAnimal` の **実装者** が `A` の具体的な型を定め、 `makeAnimal` の **利用者** は抽象的な `A` に対してコードを書く。

『リバースジェネリクス』という概念を導入すると、 **Opaque Result Type は『リバースジェネリクス』のシンタックスシュガーである**と考えることができる。

```swift
// 『リバースジェネリクス』
func makeAnimal() -> <A: Animal> A {
    return Cat()
}

// Opaque Result Type
func makeAnimal() -> some Animal {
    return Cat()
}
```

ただ、Opaque Return Types を利用した場合、戻り値の型としてプロトコルを使用することによって提供される複数の種類の値を返す柔軟性は失ってしまう。

```swift
// OK
func makeAnimal() -> some Animal {
    let isEven = Int.random(in: 0...100) % 2 == 0
    return isEven ? Cat(name: "たま") : Cat(name: "にゃー")
}

// コンパイルエラー
func makeAnimal() -> some Animal {
    let isEven = Int.random(in: 0...100) % 2 == 0
    return isEven ? Cat(name: "たま") : Dog()
}
```

### 参考

- 主に次の記事の引用です。
  [Swift 5.1 に導入される Opaque Result Type とは何か - Qiita](https://qiita.com/koher/items/338d2f2d0c4731e3508f)
- [Understanding Opaque Return Types in Swift | by Alfian Losari | Medium](https://medium.com/@alfianlosari/understanding-opaque-return-types-in-swift-9c36fb5dfa86)

## Property Wrapper

### `wrappedValue`/`projectedValue`について

下記のように、name プロパティに対して UserDefaults の property wrapper を設定しているとする。

```swift
@AppStorage("name")
var name: String　= ""
```

この場合、name プロパティへのアクセス方法とその結果は以下のようになります。

| アクセス方法 | 型                   | 間接的にアクセスする場合 | 補足                                                         |
| :----------- | -------------------- | :----------------------- | :----------------------------------------------------------- |
| `_name`      | `AppStorage<String>` |                          | property wrapper そのものを示す。<br />private であるので、外部からの利用は不可。 |
| `name`       | `String`             | `_name.wrappedValue`     | 格納している値を示す。                                       |
| `$name`      | `Binding<String>`    | `_name.projectedValue`   | 値に関する付加情報を示す。                                   |

SwiftUI で利用する主な`propertyWrapper`とその`wrappedValue`/`projectedValue`について

|        `propertyWrapper`        |         `wrappedValue`          |                `projectedValue`                 |
| :-----------------------------: | :-----------------------------: | :---------------------------------------------: |
|         `State<Value>`          | `Value { get nonmutating set }` |            `Binding<Value> { get }`             |
|        `Binding<Value>`         | `Value { get nonmutating set }` |            `Binding<Value> { get }`             |
|  `ObservedObject<ObjectType>`   |      `ObjectType { get }`       |  `ObservedObject<ObjectType>.Wrapper { get }`   |
| `EnvironmentObject<ObjectType>` |      `ObjectType { get }`       | `EnvironmentObject<ObjectType>.Wrapper { get }` |
|      `Environment<Value>`       |         `Value { get }`         |                   × (未定義)                    |

## Rx

map() は Sequence を操作しないで、Element を加工する  
flatMap() は Sequence を消して Element を取り出すので、また Sequence を作成して返す必要があり

## 
