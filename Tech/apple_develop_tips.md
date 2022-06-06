## キャリア

* [Why iOS Developers Feel Stuck In Their Careers & What To Do — Essential Developer](https://www.essentialdeveloper.com/articles/why-ios-developers-feel-stuck-in-their-careers-and-what-to-do)

## デバイスとCPUアーキテクチャとチップ

| アーキテクチャ                                | チップ                                                       | 32/64bit | 端末                                                         |
| :-------------------------------------------- | ------------------------------------------------------------ | :------: | :----------------------------------------------------------- |
| [ARMv7](https://en.wikipedia.org/wiki/ARMv7)  | [A4](https://en.wikipedia.org/wiki/Apple_A4)<br />[A5](https://en.wikipedia.org/wiki/Apple_A5)<br />[A5X](https://en.wikipedia.org/wiki/Apple_A5X) |  32bit   | iPhone 4<br/>iPhone 4S<br />iPad (1st generation)<br/>iPad 2 (iPad2,1; iPad2,2; iPad2,3; iPad2,4)<br/>iPad (3rd generation)<br />iPad Mini (1st generation)<br />iPod Touch (4th generation)<br/>Apple TV (2nd generation)<br />Apple TV (3rd generation)<br/>iPod Touch (5th generation) |
| [ARMv7s](https://en.wikipedia.org/wiki/ARMv7) | [A6](https://en.wikipedia.org/wiki/Apple_A6)<br /> [A6X](https://en.wikipedia.org/wiki/Apple_A6X) |  32bit   | iPhone 5<br />iPhone5C<br />iPad (4th generation)            |
| ARMv8系                                       | [A7](https://en.wikipedia.org/wiki/Apple_A7)<br />[A8](https://en.wikipedia.org/wiki/Apple_A8)<br />[A8X](https://en.wikipedia.org/wiki/Apple_A8X)<br />[A9](https://en.wikipedia.org/wiki/Apple_A9)<br />[A9X](https://en.wikipedia.org/wiki/Apple_A9X)<br />[A10 Fusion](https://en.wikipedia.org/wiki/Apple_A10)<br />[A10X Fusion](https://en.wikipedia.org/wiki/Apple_A10X)<br />[A11 Bionic](https://en.wikipedia.org/wiki/Apple_A11)<br />[A12 Bionic](https://en.wikipedia.org/wiki/Apple_A12)<br />[A12X Bionic](https://en.wikipedia.org/wiki/Apple_A12X)<br />[A12Z Bionic](https://en.wikipedia.org/wiki/Apple_A12Z)<br />[A13 Bionic](https://en.wikipedia.org/wiki/Apple_A13)<br />[A14 Bionic](https://en.wikipedia.org/wiki/Apple_A14) |  64bit   | iPhone 5S<br/>iPhone 6<br/>iPhone 6 Plus<br/>iPhone 6S<br/>iPhone 6S Plus<br/>iPhone SE (1st generation)<br/>iPhone 7<br/>iPhone 7 Plus<br/>iPhone 8<br/>iPhone 8 Plus<br/>iPhone X<br />iPhone XS<br/>iPhone XS Max<br/>iPhone XR<br/>iPhone 11<br/>iPhone 11 Pro<br/>iPhone 11 Pro Max<br/>iPhone SE (2nd generation)<br />iPhone 12<br/>iPhone 12 mini<br/>iPhone 12 Pro<br/>iPhone 12 Pro Max<br />iPod Touch (6th generation)<br/>iPod Touch (7th generation)<br/>iPad (5th generation)<br />iPad (6th generation)<br/>iPad (7th generation)<br />iPad (8th generation)<br />iPad Pro (9.7-inch)<br />iPad Pro (10.5-inch)<br/>iPad Pro (12.9-inch) (1st generation)<br/>iPad Pro (12.9-inch) (2nd generation)<br/>iPad Pro (12.9-inch) 3rd generation)<br />iPad Pro (12.9-inch) (4th generation)<br />iPad Pro (11-inch) (1st generation)<br/>iPad Pro (11-inch) (2nd generation)<br/>iPad Mini 2<br/>iPad Mini 3<br />iPad Mini 4<br/>iPad Mini (5th generation)<br/>iPad Air (1st generation)<br />iPad Air (3rd generation)<br/>iPad Air (4th generation)<br />iPad Air 2<br />Apple TV HD<br/>Apple TV 4K<br />HomePod<br /> |

（端末によっては複数のチップを含みますが、ここではAシリーズのチップ（モバイル・コンピューティング機能を提供するために必要な電子機器を1つの物理的なパッケージに統合しているチップ）について記載しています。）

### 参考

* [Apple A5 - Wikipedia](https://ja.wikipedia.org/wiki/Apple_A5)
* [Apple A6 - Wikipedia](https://ja.wikipedia.org/wiki/Apple_A6)

## iOSとフレームワーク

> iOS + Swift の上でオープンソースのフレームワークを使うことは辞めた方が良いと思います。OSそのものが勢いよく進化しているので、フレームワークを使うメリットが少ないし、すぐに陳腐化してしまう可能性があります。ブラウザーの上で Vue や React などのフレームワークが意味を持つのは、ブラウザーそのものの開発環境が貧弱な上に、ブラウザーごとに細かな違いがあるからです。そこを勘違いしないように注意してください。

引用: 週刊 Life is Beautiful ２０２０年１２月２９日号

## iOSの基礎

* 公式チュートリアル: [iOS App Dev Tutorials | Apple Developer Documentation](https://developer.apple.com/tutorials/app-dev-training)

## iPhoneの解像度

### （前提） ドットとピクセル

* ドット: 画像入出力装置において光の強弱を表現できる最小単位。
* ピクセル: 画像入出力装置においてカラー画像を表すための最小の単位。カラー画像を表すための最小単位なので、赤緑青の三つを合わせたものとなる。

よって、カラーを表現する際は3ドットが必要となる。
一方で白黒画像の場合はピクセルの概念は不要となる。

#### 入出力装置とドット/ピクセル

* 液晶モニター（2枚のガラス板の間に液晶を入れ、電圧の変化によって画面を表示させるモニタ。[液晶モニターとは - コトバンク](https://kotobank.jp/word/%E6%B6%B2%E6%99%B6%E3%83%A2%E3%83%8B%E3%82%BF%E3%83%BC-11966)）
* * 赤青緑の3ドットで1ピクセルになる
* デジタルカメラ
  *  1ドット＝1ピクセル。
  *  1ドットでは1色の色情報しか読み取れないが、色情報を周囲の別の色の素子から推測して、1ドットに3色分の色情報を持たせている。
* プリンター
  * 256ドット=1ピクセル  

### iOSのポイントとピクセル

>The purpose of using points (and the logical coordinate system) is to provide a consistent size of output that is device independent.

ポイント（および論理座標系）を使用する目的は、デバイスに依存しない一貫したサイズの出力を提供することにあります。

>How points are actually mapped to pixels is a detail that is handled by the system frameworks. For example, on a device with a high-resolution screen, a line that is one point wide may actually result in a line that is two physical pixels wide. The result is that if you draw the same content on two similar devices, with only one of them having a high-resolution screen, the content appears to be about the same size on both devices.

ポイントが実際にどのようにピクセルにマッピングされるかは、システムフレームワークによって詳細に処理されます。例えば、高解像度の画面を持つデバイスでは、1ポイントの幅の線が、実際には2ピクセルの幅になることがあります。その結果、同じコンテンツを2台の似たようなデバイスで描いた場合、片方のデバイスだけが高解像度の画面を持っていても、コンテンツは両方のデバイスでほぼ同じサイズに見えることになります。

>Thus, any content you draw in your drawRect: method is scaled appropriately for the underlying device’s screen.

drawRect: メソッドで描画するコンテンツは、基礎となるデバイスの画面に合わせて適切にスケーリングされます。

### 参考

* [ドットとピクセルの違い](https://photo.nyanta.jp/DotAndPixel.html)
* [The Ultimate Guide To iPhone Resolutions](https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

## LibraryやFrameworkについて

|                  | 拡張子       | 概要                                                         |
| ---------------- | ------------ | ------------------------------------------------------------ |
| StaticLibrary    | .a           | ビルド時に静的に組み込まれるライブラリ <br />ビルド時にシンボルが解決される |
| DynamicLibrary   | .dylib       | ランタイム時にシンボルが解決されるライブラリ（ビルド時は参照だけが設定される）<br />iOS,macOS のシステムライブラリ (UIKit, Foundation 等) は Dynamic Library として提供されている。そのため、アプリの更新をしなくともシステムライブラリの更新が行えるようになっている。 |
| StaticFramework  | .framework   | バンドルを保有しスタティックリンクするもの<br />モジュールを含む場合と含まない場合がある |
| DynamicFramework | .framework   | バンドルを保有しダナミックリンクするもの<br />モジュールを含む場合と含まない場合がある |
| XCFramework      | .xcframework | エミュレータやデバイスなどの複数のプラットフォームを同じバンドルに入れられる。<br />ひとつのXCFrameworkの中に複数の `.framework` がバンドルされる |

### FrameworkとLibraryの違いは？

バンドルを持つかどうか。

バンドルとは？

一定のディレクトリ構造をもつもの。ディレクトリであるが利用者はファイルのように扱える。ヘッダーやリソースも保持できる。

> - A *bundle* is a directory with a standardized hierarchical structure that holds executable code and the resources used by that code.

[About Bundles](https://developer.apple.com/library/archive/documentation/CoreFoundation/Conceptual/CFBundles/AboutBundles/AboutBundles.html#//apple_ref/doc/uid/10000123i-CH100-SW1)

### リンクとは？

ソースコードをコンパイルして生成されたオブジェクトファイル、及び外部ライブラリを全て連結して1つの実行形式ファイル、あるいはライブラリを生成すること。

全てのソースコードをコンパイルした後に行われる。

フレームワークのリンク
→ `FRAMEWORK_SEARCH_PATHS`にフレームワークがあるディレクトリの親ディレクトリを指定する
→ `OTHER_LDFLAGS`に`-framework <FrameworkName>`と指定する

ライブラリのリンク
→ `LIBRARY_SEARCH_PATHS`にライブラリがあるディレクトリの親ディレクトリを指定する
→ `OTHER_LDFLAGS`に`-l <LLibraryName>`と指定する

実際はAutomatic Linkingという機能で`import`を行なった時点でリンクの設定も行われる（上記が自動で行われる）

また、

* 動的ライブラリが他のライブラリに依存している場合、リンクされ対象のライブラリのシンボルが含まれるようになる。
* 静的ライブラリが他のライブラリに依存している場合、対象のライブラリのシンボルは含まれない。静的ライブラリ単位でシンボル解決が完了している必要はなく、それ故静的ライブラリへのリンクというタスクがそもそも存在しない。

### モジュール

PubicなAPIの宣言の集まり

`import`ではモジュールをインポートしている。
フレームワーク内にモジュールが含まれている場合にはそのパスを`FREMEWORL_SEARCH_PATHS`に追加する。そうでない場合や、ライブラリをインポートする場合は`modulemap`を作成しそれが含まれる親ディレクトリを`SWIFT_INCLUDE_PATHS`に追加する。

### 参考

* [Xcode の力を借りない Swift の Dynamic Library の作成とビルドを試す - Qiita](https://qiita.com/tasuwo/items/be8188c3645801a00252)
* [About Bundles](https://developer.apple.com/library/archive/documentation/CoreFoundation/Conceptual/CFBundles/AboutBundles/AboutBundles.html#//apple_ref/doc/uid/10000123i-CH100-SW1)
* [ModuleとFrameworkってどう違うんですか？ in Swift PM](https://www.notion.so/Module-Framework-in-Swift-PM-4d0d94563991440fb7c55711671b81de)
* [Swiftにおけるインポートとリンクの仕組みを探る - Speaker Deck](https://speakerdeck.com/kishikawakatsumi/swiftniokeruinpototorinkufalseshi-zu-miwotan-ru)

## LLDB

* 値の書き換え

``` e self.isA = true ```

* 任意の行数スキップ

``` th j --by 1 ```

## NS Prefix

NSという接頭辞はObjective-Cにおいて名前空間が存在しなかったので、名前の衝突を避けるためにつけられていたものです。

### 参考

* [NS Prefix - そこから見渡す Swift 3 の景色 #startup_mobile](https://www.slideshare.net/tomohirokumagai54/ns-prefix-swift-3-startupmobile)
* [ios - What does the NS prefix mean? - Stack Overflow](https://stackoverflow.com/questions/473758/what-does-the-ns-prefix-mean)

## P12証明書の中身の確認

``` keytool -list -v -keystore {file_name}.p12 -storetype PKCS12 -storepass {password}  ```

## Swift

###  Opaque Result Type 

Swift 5.1で導入（([SE-0244](https://github.com/apple/swift-evolution/blob/master/proposals/0244-opaque-result-types.md)）された。
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

＜1について＞ 

`makeAnimal`の利用者は `Animal`であることが知れれば良いというケースでより具体的な`Cat`型を公開しているので問題である。

＜2について＞

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

このようなExistential Type のオーバーヘッドをジェネリクスで解決することができる。

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

ジェネリクスの型パラメータを決めるのはその API の利用者である。にも関わらず↑のコードは `makeAnimal` の実装自体が `A` を `Cat` と仮定してしまっている。戻り値のジェネリクスは Swift でサポートされていますが、上記のコードは利用者ではなく実装者が型を決定しようとしているので型エラーでコンパイルに失敗する。

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

ただ、Opaque Return Typesを利用した場合、戻り値の型としてプロトコルを使用することによって提供される複数の種類の値を返す柔軟性は失ってしまう。

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

#### 参考

+ 主に次の記事の引用です。
  [Swift 5.1 に導入される Opaque Result Type とは何か - Qiita](https://qiita.com/koher/items/338d2f2d0c4731e3508f)
+ [Understanding Opaque Return Types in Swift | by Alfian Losari | Medium](https://medium.com/@alfianlosari/understanding-opaque-return-types-in-swift-9c36fb5dfa86)

## Property Wrapper

### `wrappedValue`/`projectedValue`について

下記のように、nameプロパティに対してUserDefaultsのproperty wrapperを設定しているとする。

```swift
@AppStorage("name")
var name: String　= ""
```

この場合、nameプロパティへのアクセス方法とその結果は以下のようになります。

| アクセス方法 | 型                   | 間接的にアクセスする場合 | 補足                                                         |
| :----------- | -------------------- | :----------------------- | :----------------------------------------------------------- |
| `_name`      | `AppStorage<String>` |                          | property wrapperそのものを示す。<br />privateであるので、外部からの利用は不可。 |
| `name`       | `String`             | `_name.wrappedValue`     | 格納している値を示す。                                       |
| `$name`      | `Binding<String>`    | `_name.projectedValue`   | 値に関する付加情報を示す。                                   |

SwiftUIで利用する主な`propertyWrapper`とその`wrappedValue`/`projectedValue`について

|        `propertyWrapper`        |         `wrappedValue`          |                `projectedValue`                 |
| :-----------------------------: | :-----------------------------: | :---------------------------------------------: |
|         `State<Value>`          | `Value { get nonmutating set }` |            `Binding<Value> { get }`             |
|        `Binding<Value>`         | `Value { get nonmutating set }` |            `Binding<Value> { get }`             |
|  `ObservedObject<ObjectType>`   |      `ObjectType { get }`       |  `ObservedObject<ObjectType>.Wrapper { get }`   |
| `EnvironmentObject<ObjectType>` |      `ObjectType { get }`       | `EnvironmentObject<ObjectType>.Wrapper { get }` |
|      `Environment<Value>`       |         `Value { get }`         |                   × (未定義)                    |

### SwiftUI利用時のProperty Wrapper選択フローチャート

![property_wrapper_for_swiftUI](https://user-images.githubusercontent.com/20992687/120320715-7176a180-c31d-11eb-893d-cf305e6fe931.jpg)
[引用: SwiftUIのデータ管理 Property Wrapper編](https://blog.personal-factory.com/2021/01/23/how-to-use-propertywrapper-in-swiftui/)

## Rx

ap() は Sequence を操作しないで、Element を加工する  
flatMap() は Sequence を消して Element を取り出すので、また Sequenceを作成して返す必要があり

## SwiftUI

### 起動経路

* [[Xcode 12] アプリの起動について変更になった部分まとめ | DevelopersIO](https://dev.classmethod.jp/articles/xcode12_change_appdelegate/)
* [SwiftUI App Lifecycle Explained – LearnAppMaking](https://learnappmaking.com/swiftui-app-lifecycle-how-to/)

### Animation

- [amosgyamfi/swiftui-animation-library: SwiftUI Animation Library.](https://github.com/amosgyamfi/swiftui-animation-library)
  凝ったアニメーションを作成する際に参考になりそう。

### Binding

> A property wrapper type that can read and write a value owned by a source of truth.

[Binding | Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/binding)

>データ管理をするうえで重要な概念である**Single Source of Truth（単一の信頼できる情報源）** についてお話します。
>
>一言でいうと管理するデータはひとつに絞った方がいいという考え方です。
>マスターとなるデータを１つ決めて、コピーはつくらず、それだけを更新していき、他システムに反映していきます。

[SwiftUIのデータ管理 Single Source of Truth編](https://blog.personal-factory.com/2021/01/20/whats-the-single-source-of-truth-in-swiftui/)

参照型ではない値を渡す場合に利用される場合が多い。

また下記のようなイニシャライザが存在する。

`init(get:set:)`

> Creates a binding with closures that read and write the binding value.

[init(get:set:) | Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/binding/init(get:set:)-7ufcp)

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

## UIKit

* [深く知りたい Core Animation まとめ1（レイヤー編）【iOS / Swift】 - SNOOZE LOG](https://snoozelag.hatenablog.com/entry/2021/12/18/003933)

## UX

* エラーメッセージでは「どうやったら」回復するかを示す
  * エラーメッセージを出す目的はユーザーに異常であることのフィードバックを伝えることであり、その後にユーザーが望むのはその状態からの回復である
* 先に要素があることを少し見せる
  * コンテンツの端を少し見せることでユーザーがスクロールして追加コンテンツを見つけやすくできる
* 一覧から項目を押して詳細画面に遷移する場合は戻るまで一覧のハイライトを残す
  * ユーザーが前にどの項目をみたか、ということに意識を割くことを防げる
  * [UITableViewのUX改善(今すぐ出来る！)](https://qiita.com/trsxxii/items/8f71ca67da4c6f4b78d2)

## WebKit

AppleのはiOSプラットフォーム上においてWebKit以外のブラウザエンジンを禁止している。  
そしてWebKitはアプリケーションというよりかは「コンテンツエンジン」としての役割を担うことを目的としている。つまり、ネイティブアプリと同じような機能をWebKitベースで実現することが難しくなるのも当然。  
一方でBlinkのミッションは「Webを世界の情報を体験するための最高のプラットフォームにし、世界で最も優れたWebプラットフォームの実装を提供する」というもの。その意味するところは、Blinkが自社のエンジンをネイティブアプリと直接競合させ、コンシューマ向けインターネットの「最高のプラットフォーム」になることを望んでいる。実際にAndroid上で動作する最新のPWAは、Androidのネイティブアプリと[同じくらい優れた](https://web.dev/app-like-pwas/)ユーザ・エクスペリエンスを提供するようになってきている。  
iOSではブラウザエンジンの選択肢がないだけでなく、WebKit自体がブラウザエンジンとして不十分だということです。現在、Microsoft Edgeのパートナー・プログラム・マネージャーを務め、その前はGoogle Chromeのシニアエンジニアとして長年活躍してきたる[アレックス・ラッセル](https://twitter.com/slightlylate)は、[AppleのWebに対するアプローチ](https://infrequently.org/2021/08/webkit-ios-deep-dive/)について多くのことを書いている。彼はまだGoogleに在籍していた頃、[WebKitに対する長い評論](https://infrequently.org/2021/04/progress-delayed/)を発表し、「AppleのWebエンジンは、互換性と機能の両方で一貫して他のエンジンを遅れをとっており、その結果、Appleのネイティブ・プラットフォームとの間には大きなギャップが持続している」と結論付けた。

[ブログ: Appleのブラウザエンジン禁止は、Webアプリのイノベーションを妨げている](https://okuranagaimo.blogspot.com/2021/09/appleweb.html)


## Xcode関連のコマンド

Swift Packageで追加したライブラリのパス

```
export SPM_ROOT=${BUILD_DIR%Build/*}SourcePackages/checkouts
```

環境変数とその値の確認

```
xcodebuild -project [プロジェクトディレクトリ] -target [対象target] -showBuildSettings
xcodebuild -workspace [ワークスペースディレクトリ] -scheme [対象scheme] -showBuildSettings
```

有効になっているいるCommand Line Toolsのパス

```
xcode-select -p
```

Command Line Toolsの切り替える

```
sudo xcode-select -s /Applications/Xcode-12.0.0.app
```

利用できるSDK一覧

```
xcodebuild -showsdks
```

利用できるシミュレータ一覧

```
xcrun simctl list devicetypes
```

## Xcodeのビルド結果出力先

`Xcode -> Preferences -> Locations -> Derived Data` に設定されている場所に出力される。

デフォルトは `/Users/(ユーザー名)/Library/Developer/Xcode/DerivedData/`

## Xcodeのビルド設定項目

[Build Settings Reference | Apple Developer Documentation](https://developer.apple.com/documentation/xcode/build-settings-reference)

## その他メモ

* CocoaPodsでローカルのpodspecを参照する
`pod 'Demolivery', :podspec => "../development/Demolivery.podspec"`
