# Swift

## Keypath

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

## //MARK

```
// MARK: - IBOutlet

// MARK: - Property

// MARK: - Life Cycle

// MARK: - Static Func

// MARK: - Internal Func

// MARK: - Private Func

// MARK: - Action
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

## SwiftUI 利用時の Property Wrapper 選択フローチャート

![property_wrapper_for_swiftUI](https://user-images.githubusercontent.com/20992687/120320715-7176a180-c31d-11eb-893d-cf305e6fe931.jpg)
[引用: SwiftUI のデータ管理 Property Wrapper 編](https://blog.personal-factory.com/2021/01/23/how-to-use-propertywrapper-in-swiftui/)

## Rx

map() は Sequence を操作しないで、Element を加工する  
flatMap() は Sequence を消して Element を取り出すので、また Sequence を作成して返す必要があり

## SwiftUI

### 起動経路

- [[Xcode 12] アプリの起動について変更になった部分まとめ | DevelopersIO](https://dev.classmethod.jp/articles/xcode12_change_appdelegate/)
- [SwiftUI App Lifecycle Explained – LearnAppMaking](https://learnappmaking.com/swiftui-app-lifecycle-how-to/)

### Animation

- [amosgyamfi/swiftui-animation-library: SwiftUI Animation Library.](https://github.com/amosgyamfi/swiftui-animation-library)
  凝ったアニメーションを作成する際に参考になりそう。

### Binding

> A property wrapper type that can read and write a value owned by a source of truth.

[Binding | Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/binding)

> データ管理をするうえで重要な概念である**Single Source of Truth（単一の信頼できる情報源）** についてお話します。
>
> 一言でいうと管理するデータはひとつに絞った方がいいという考え方です。
> マスターとなるデータを１つ決めて、コピーはつくらず、それだけを更新していき、他システムに反映していきます。

[SwiftUI のデータ管理 Single Source of Truth 編](https://blog.personal-factory.com/2021/01/20/whats-the-single-source-of-truth-in-swiftui/)

参照型ではない値を渡す場合に利用される場合が多い。

また下記のようなイニシャライザが存在する。

`init(get:set:)`

> Creates a binding with closures that read and write the binding value.

[init(get:set:) | Apple Developer Documentation](<https://developer.apple.com/documentation/swiftui/binding/init(get:set:)-7ufcp>)

例えばアクティブ状態を監視する`Binding`は次のように定義できる

```swift
public var isActiveBinding: Binding<Bool> {
        .init(get: { self.isActive },
              set: { self.isActive = $0 }
        )
    }
```

### ViewModifier

再利用可能なモディファイアを作成したい場合に利用する。
[ViewModifier | Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/viewmodifier)