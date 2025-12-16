読みたい

* https://developer.apple.com/jp/documentation/technotes/tn3155-debugging-universal-links/

記載する

* https://blog.smartbank.co.jp/entry/2023/08/30/swiftui-touch-target-size

---

## Watch Dog

* iOS のシステム監視プロセス（watchdogd）
* アプリが OS の要求に応答しない・終了しない・長時間処理を続けると、**強制終了（0x8badf00d）**する

[📘 参考: Apple - Addressing Watchdog Terminations
](https://developer.apple.com/documentation/xcode/addressing-watchdog-terminations)

動作検証時の注意
* Xcode で Run（デバッグ接続）している状態では、Watchdog の監視が緩和または無効化される。
* そのため：
  * バックグラウンドでも処理が継続するように見える
  * サスペンドされにくい／kill されない
*	Debug > Detach from Process またはホーム画面から起動して検証する
*	OSLogを使用し、コンソールでログを見るのが良い
  
## instruments

1. Xcodeで「⌘+I」→「Profile」実行
2. 「Time Profiler」テンプレートを選択
3. 適当な期間で計測

### パフォーマンス問題の確認

- ⚠️ __Thermal State: "Serious"__ → デバイス過熱
- 📊 __CPU使用率が高い__ → 青いグラフの状態
- 🔄 __継続的な処理__ → グラフが一定

### 分析の進め方

- 下部タブで「Call Tree」選択

よく使う設定:

- ✅ Separate by Thread
- ⚠️ Invert Call Tree → 用途に応じて選択
- ✅ Hide System Libraries
- ✅ Flatten Recursion

**Invert OFF**

MyClass.myFunction()  ← 関数名がはっきり見える
├── 子関数の処理
└── 実行時間が明確

- 実行フローが追いやすい
- 呼び出し階層が分かりやすい

**Invert ON**

- システムボトルネック分析向き
- 重い処理の根本原因特定
- ただし、Swift Concurrency等では見にくい場合あり

## 画像のOrientation

* 撮影時のカメラセンサーの上端が、RAW 画像の “上端”になる
* 端末を左に傾けてとったデータは`right`になり傾きを補正して表示するには90度時計回りに回転する必要がある

## iOS関連の技術

* Widget
* Live Activities
* DockKit
* Core ML
* 

## キャリア

- [Why iOS Developers Feel Stuck In Their Careers & What To Do — Essential Developer](https://www.essentialdeveloper.com/articles/why-ios-developers-feel-stuck-in-their-careers-and-what-to-do)

## App Thinning

App Thinning は、アプリの自動最適化および配信を支援する技術。これにより、ユーザーの端末に合わせて最適なアプリのバージョンを提供できる。  
具体的には、App Thinning は「App Slicing」、「On-Demand Resources (ODR)」、「Bitcode」の三つの主要な技術に分けられる。

* App Slicing: アプリの各バージョンが特定のデバイスに必要なリソースやバイナリのみを含むようにする技術。例えば、iPhone Xのユーザーがアプリをダウンロードする場合、Appleは arm64 アーキテクチャと @3x リソースのバイナリを選択して提供する。
* On-Demand Resources (ODR): アプリが特定のリソースを必要とする時点でのみ、それらをダウンロードする機能を提供する。これにより、アプリの初期ダウンロードサイズを減少させ、端末のストレージを有効活用できる。
* Bitcode: アプリをAppleの中間表現であるBitcodeにコンパイルし、App Storeにアップロードする。その後、Appleが異なるデバイスアーキテクチャに合わせて最適化された機械語に自動的に変換する。これにより、新しいプロセッサがリリースされた際に、開発者がアプリを再コンパイルすることなく対応できるようになる。しかし、Xcode14以降App StoreはXcodeからのビットコードの送信を受け付けなくなった（恐らく64bit対応してないデバイスがなくなり再コンパイルの必要がなくなったから？）。bitcodeが不要になると、App Store Connect上で新しいdSYMが吐き出されることがなくなる。つまりリリースビルド(アーカイブ)時に一緒に生成されたdSYMをFirebase Crashlyticsなどにアップロードすることになり、これはApp Store Connect上でそれが作られるまで待つ必要が無くなったことを意味する。

参考
* https://qiita.com/taki4227/items/db9b503e56ab25a8a375
* https://help.apple.com/xcode/mac/current/#/devbbdc5ce4f
* https://qiita.com/temoki/items/92999fcede0a7b89760f
* https://akerun.hateblo.jp/entry/2022/12/22/xcode14_bitcode

## シングルAppモード

> シングルAppモードでは、選択したAppがデバイス上で強制的に開かれ、ほかのAppは使用できません。このペイロードが有効な場合、Appはデバイスが再起動するとすぐに再度開きます。

[Apple ConfiguratorでシングルAppモードを開始する - Apple サポート (日本)](https://support.apple.com/ja-jp/guide/apple-configurator-mac/cadbf9c172/mac)

> シングルAPPモードは、iOS端末やiPadOS端末で起動できるアプリを1つのみに制限する機能です。設定を行うとホームボタンを押下しても指定したアプリからホーム画面および他のアプリへ遷移できなくなり、アプリの使用を限定することができます。
加えて、タッチ操作の無効や音量調節ボタンの無効、自動ロックの無効設定することもできます。設定を管理者が遠隔から複数の端末に向けて一斉に行うことができるというのが、MDMからシングルAppモードを利用する一番のメリットになります。

ユースケース  
* 客室でお客様に端末をご利用いただく
* 展示会・お店で動画を流す

[Optimal Biz機能紹介 –iOS端末のキオスク化を実現するシングルAPPモード機能をご紹介 | Optimal Biz](https://www.optimalbiz.jp/blog/single-app-mode/)

## OS更新

- 例えばiOSにおいて直近2世代をサポートするケースにおいて、3世代目をいつ切るか
  - 9割以上いるOSに絞る
  - 切る場合はお知らせを先にし、猶予（3ヶ月ぐらい？）後に対応をする（先に切ってしまうと強制アップデート機能のタイミングでOS更新を余儀無くされるユーザーが発生する）
- Androidは端末が多いので、OSで切るしかない（iOSも端末を考える必要が特になければOSを切るので良い）

## iOS とフレームワーク

> iOS + Swift の上でオープンソースのフレームワークを使うことは辞めた方が良いと思います。OS そのものが勢いよく進化しているので、フレームワークを使うメリットが少ないし、すぐに陳腐化してしまう可能性があります。ブラウザーの上で Vue や React などのフレームワークが意味を持つのは、ブラウザーそのものの開発環境が貧弱な上に、ブラウザーごとに細かな違いがあるからです。そこを勘違いしないように注意してください。

引用: 週刊 Life is Beautiful ２０２０年１２月２９日号

## iPhone の解像度

### （前提） ドットとピクセル

- ドット: 画像入出力装置において光の強弱を表現できる最小単位。
- ピクセル: 画像入出力装置においてカラー画像を表すための最小の単位。カラー画像を表すための最小単位なので、赤緑青の三つを合わせたものとなる。

よって、カラーを表現する際は 3 ドットが必要となる。
一方で白黒画像の場合はピクセルの概念は不要となる。

#### 入出力装置とドット/ピクセル

- 液晶モニター（2 枚のガラス板の間に液晶を入れ、電圧の変化によって画面を表示させるモニタ。[液晶モニターとは - コトバンク](https://kotobank.jp/word/%E6%B6%B2%E6%99%B6%E3%83%A2%E3%83%8B%E3%82%BF%E3%83%BC-11966)）
- 赤青緑の 3 ドットで 1 ピクセルになる
- デジタルカメラ
  - 1 ドット＝ 1 ピクセル。
  - 1 ドットでは 1 色の色情報しか読み取れないが、色情報を周囲の別の色の素子から推測して、1 ドットに 3 色分の色情報を持たせている。
- プリンター
  - 256 ドット=1 ピクセル

### iOS のポイントとピクセル

> The purpose of using points (and the logical coordinate system) is to provide a consistent size of output that is device independent.

ポイント（および論理座標系）を使用する目的は、デバイスに依存しない一貫したサイズの出力を提供することにあります。

> How points are actually mapped to pixels is a detail that is handled by the system frameworks. For example, on a device with a high-resolution screen, a line that is one point wide may actually result in a line that is two physical pixels wide. The result is that if you draw the same content on two similar devices, with only one of them having a high-resolution screen, the content appears to be about the same size on both devices.

ポイントが実際にどのようにピクセルにマッピングされるかは、システムフレームワークによって詳細に処理されます。例えば、高解像度の画面を持つデバイスでは、1 ポイントの幅の線が、実際には 2 ピクセルの幅になることがあります。その結果、同じコンテンツを 2 台の似たようなデバイスで描いた場合、片方のデバイスだけが高解像度の画面を持っていても、コンテンツは両方のデバイスでほぼ同じサイズに見えることになります。

> Thus, any content you draw in your drawRect: method is scaled appropriately for the underlying device’s screen.

drawRect: メソッドで描画するコンテンツは、基礎となるデバイスの画面に合わせて適切にスケーリングされます。

- [ドットとピクセルの違い](https://photo.nyanta.jp/DotAndPixel.html)
- [The Ultimate Guide To iPhone Resolutions](https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

## Library や Framework について

|                  | 拡張子       | 概要                                                                                                                                                                                                                                                                    |
| ---------------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| StaticLibrary    | .a           | ビルド時に静的に組み込まれるライブラリ <br />ビルド時にシンボルが解決される                                                                                                                                                                                             |
| DynamicLibrary   | .dylib       | ランタイム時にシンボルが解決されるライブラリ（ビルド時は参照だけが設定される）<br />iOS,macOS のシステムライブラリ (UIKit, Foundation 等) は Dynamic Library として提供されている。そのため、アプリの更新をしなくともシステムライブラリの更新が行えるようになっている。 |
| StaticFramework  | .framework   | バンドルを保有しスタティックリンクするもの<br />モジュールを含む場合と含まない場合がある                                                                                                                                                                                |
| DynamicFramework | .framework   | バンドルを保有しダナミックリンクするもの<br />モジュールを含む場合と含まない場合がある                                                                                                                                                                                  |
| XCFramework      | .xcframework | エミュレータやデバイスなどの複数のプラットフォームを同じバンドルに入れられる。<br />ひとつの XCFramework の中に複数の `.framework` がバンドルされる                                                                                                                     |

### Framework と Library の違いは？

バンドルを持つかどうか。

バンドルとは？

一定のディレクトリ構造をもつもの。ディレクトリであるが利用者はファイルのように扱える。ヘッダーやリソースも保持できる。

> - A _bundle_ is a directory with a standardized hierarchical structure that holds executable code and the resources used by that code.

[About Bundles](https://developer.apple.com/library/archive/documentation/CoreFoundation/Conceptual/CFBundles/AboutBundles/AboutBundles.html#//apple_ref/doc/uid/10000123i-CH100-SW1)

### リンクとは？

ソースコードをコンパイルして生成されたオブジェクトファイル、及び外部ライブラリを全て連結して 1 つの実行形式ファイル、あるいはライブラリを生成すること。

全てのソースコードをコンパイルした後に行われる。

フレームワークのリンク
→ `FRAMEWORK_SEARCH_PATHS`にフレームワークがあるディレクトリの親ディレクトリを指定する
→ `OTHER_LDFLAGS`に`-framework <FrameworkName>`と指定する

ライブラリのリンク
→ `LIBRARY_SEARCH_PATHS`にライブラリがあるディレクトリの親ディレクトリを指定する
→ `OTHER_LDFLAGS`に`-l <LLibraryName>`と指定する

実際は Automatic Linking という機能で`import`を行なった時点でリンクの設定も行われる（上記が自動で行われる）

また、

- 動的ライブラリが他のライブラリに依存している場合、リンクされ対象のライブラリのシンボルが含まれるようになる。
- 静的ライブラリが他のライブラリに依存している場合、対象のライブラリのシンボルは含まれない。静的ライブラリ単位でシンボル解決が完了している必要はなく、それ故静的ライブラリへのリンクというタスクがそもそも存在しない。

### モジュール

Pubic な API の宣言の集まり

`import`ではモジュールをインポートしている。
フレームワーク内にモジュールが含まれている場合にはそのパスを`FREMEWORL_SEARCH_PATHS`に追加する。そうでない場合や、ライブラリをインポートする場合は`modulemap`を作成しそれが含まれる親ディレクトリを`SWIFT_INCLUDE_PATHS`に追加する。

### 参考

- [Xcode の力を借りない Swift の Dynamic Library の作成とビルドを試す - Qiita](https://qiita.com/tasuwo/items/be8188c3645801a00252)
- [About Bundles](https://developer.apple.com/library/archive/documentation/CoreFoundation/Conceptual/CFBundles/AboutBundles/AboutBundles.html#//apple_ref/doc/uid/10000123i-CH100-SW1)
- [Module と Framework ってどう違うんですか？ in Swift PM](https://www.notion.so/Module-Framework-in-Swift-PM-4d0d94563991440fb7c55711671b81de)
- [Swift におけるインポートとリンクの仕組みを探る - Speaker Deck](https://speakerdeck.com/kishikawakatsumi/swiftniokeruinpototorinkufalseshi-zu-miwotan-ru)

## Font

* monospacedDigitSystemFont: 数字を等幅にするFont
  * > macOSやiOSのシステムフォントには、数字を等幅にするAPI (monospacedDigitSystemFont)があるのだけど、こいつの使い所はこういった「数字が連続的に変化するUI」で使う。でないと文字列の幅がガタガタ揺れてしまって見た目が美しくない。
  * https://twitter.com/usagimaruma/status/1615952407258882048

* AppleはWWDC 2015でオリジナルフォントのSan Franciscoを発表。それ以後iOSでデフォルトで利用されるシステムフォントはSan Francisco。
しかし、San Franciscoには日本語のグリフが含まれていないのでシステムフォントを指定したテキストはアルファベットの部分をSan Franciscoで表示し、ひらがなや漢字の部分をHiragino Sansで表示するようになっている。そしてAppleのシステムフォントにはHiragino Sansをやや小さく表示する（元の約93.5%のサイズにする）という調整が入っている。これはSan FranciscoのアルファベットとHiragino Sansひらがなや漢字が並んだときに同じくらいの大きさに見えるようにという調整のため。
そのためFigmaなどのデザインツールで作成・指定した日本語のラベルのサイズをそのまま実装に利用すると、想定していたよりも少し小さく表示されてしまうことになる。これは日本語の文字の場合にのみ発生し、そもそもテキストオブジェクトにアルファベットや数字のみしか使用しない場合などは気にする必要はない。 [UIデザイナーに必要なiOSのTypographyの知識｜よつくら｜note](https://spinners.work/posts/kudakurage-figma-ios-ja-system-font-size-plugin/)

## LLDB

- 値の書き換え

`e self.isA = true`

- 任意の行数スキップ

`th j --by 1`

## NS Prefix

NS という接頭辞は Objective-C において名前空間が存在しなかったので、名前の衝突を避けるためにつけられていたものです。

参考

- [NS Prefix - そこから見渡す Swift 3 の景色 #startup_mobile](https://www.slideshare.net/tomohirokumagai54/ns-prefix-swift-3-startupmobile)
- [ios - What does the NS prefix mean? - Stack Overflow](https://stackoverflow.com/questions/473758/what-does-the-ns-prefix-mean)

## P12 証明書の中身の確認

`keytool -list -v -keystore {file_name}.p12 -storetype PKCS12 -storepass {password} `

## Picker と Menu

| 観点      | Picker           | Menu                 |
| ------- | ---------------- | -------------------- |
| 主な目的    | **状態（State）を選ぶ** | **アクション（Action）を実行** |
| 選択の持続性  | 継続               | なし                   |
| タップ後の挙動 | 値がバインドされる        | 即アクション発火             |
| 適したケース  | 設定・選択値           | 操作・行動                |
| HIG 的意図 | 長い選択肢リストを扱う      | コンテキストアクションの提示       |

## SwiftUI

### safeAreaPadding

SafeAreaとはiOS 11 から導入された、iPhone X 以降の端末において、ノッチやホームインジケータなどの UI 要素を考慮して、コンテンツが表示される領域を定義するためのもの。SafeArea は、デバイスの画面上でコンテンツが安全に表示される領域を示す。

safaAreaPaddingを設定することでSafeAreaの領域を調整することができる。

例えば、

```.swift

ScrollView(.horizontal) {
    HStack {
        ForEach(0..<10) { i in
            Circle()
                .frame(width: 50, height: 50)
        }
    }
}
.safeAreaPadding(50)

```

のようにすると両端から50ptの領域にインセットが追加され中の要素が50ptずつ内側に移動しつつ、
しかしpaddingを設定した時のように要素が区切れることはない。

### PreferenceKey

PreferenceKey 自体は「キー（型）」の定義をしているだけで、値そのものを保持しているわけではない。
SwiftUI の内部では、ビュー階層を走査しながら各ビューが指定する preference(key:value:) を収集集約していく。その際に使われるのが PreferenceKey という仕組みで、「このキーに対応する値をどのように初期化し、どうやって集約（combine）していくか」をプロトコルで指定している。

* static var defaultValue: Self.Value { get }: デフォルト値

* static func reduce(value: inout Self.Value, nextValue: () -> Self.Value): SwiftUI が内部で子ビューから上がってきた次の値 (nextValue()) を取り出しつつ、引数の value（これまで集約してきた値）を更新する際の挙動

### ViewでStateやStateObjectのinitについて

❌

```swift
struct SimpleView: View {
    @State private var greeting: String
    init(name: String) {
        _greeting = State(initialValue: "Hello \(name)!")
    }

    var body: some View {
        VStack {
            Text(greeting)
            Button(action: { greeting = "Hello Tim!" }) {
                Text("Update greeting")
            }
        }
    }
}
```

State変数は、初期化子を通じて渡されるデータから初期化されるべきではない。

Stateや, StateObjec, EnvironmentObjectなどのプロパティラッパーはDynamicPropertyに準拠している。

> The view gives values to these properties prior to recomputing the view’s body.

DynamicPropertyを使用する場合、メンバープロパティにViewのデータのために外部ストレージが必要であることを SwiftUI に伝える。  
そして、その外部ストレージがプロパティに割り当てられると、SwiftUI は常にそこから読み取り、その値を実際のViewに割り当ててから、bodyを再計算する。
initで値を渡しても値が外部ストレージにあればそれを使用するので、毎回新しいStateに更新されるわけではない。

https://developer.apple.com/documentation/swiftui/dynamicproperty

https://www.swiftcraft.io/articles/how-to-initialize-state-inside-the-views-init-

StateObjectの初期化が一度しか呼ばれないことは、下記のように記載されている。

```swift
    /// ### Initialize using external data
    ///
    /// If the initial state of a state object depends on external data, you can
    /// call this initializer directly. However, use caution when doing this,
    /// because SwiftUI only initializes the object once during the lifetime of
    /// the view --- even if you call the state object initializer more than
    /// once --- which might result in unexpected behavior. For more information
    /// and an example, see ``StateObject``.
    ///
    /// - Parameter thunk: An initial value for the state object.
    @inlinable nonisolated public init(wrappedValue thunk: @autoclosure @escaping () -> ObjectType)
```

したがって、下記のような記述をした場合にModelの初期化だけが意図せず複数回実行されることになるので注意が必要

```swift
struct MovieDetailsView: View {
    
    @StateObject var viewModel: MovieDetailsViewModel
    
    init(movie: Movie) {
        let viewModel = MovieDetailsViewModel(movie: movie)
        _viewModel = StateObject(wrappedValue: viewModel)      
    }
    
    var body: some View {
        // ...
    }
}
```

この場合は下記のようにすれば一度しか実行されない（引数はautoclosureがついてるクロージャーであり、初回のみクロージャーを実行しているはず、多分）ことから、意図しない副作用が発生することはない。

```swift
struct MovieDetailsView: View {
    
    @StateObject var viewModel: MovieDetailsViewModel
    
    init(movie: Movie) {
        _viewModel = StateObject(
            wrappedValue: MovieDetailsViewModel(movie: movie)
        )      
    }
    
    var body: some View {
        // ...
    }
}
```

https://www.swiftwithvincent.com/blog/bad-practice-creating-a-stateobject-wrapper

### あるViewがUIKitを使用しているかの確認

* View Hierarchyを表示してViewの詳細をデバッグし、対象のViewをPrintしてみる。baseClassが何になっているかで判断可能
* Listの場合はUICollectionViewになっている
* SwiftUIのViewであればCGDrawingViewとなっている

https://zenn.dev/ikeh1024/articles/3baaa63f91f744

### ImageへaspectRatioをつけると

* ratio: 画像をその比率にリサイズ
* contentMode: Viewをどう表示するかを決める。
  * fill: 親Viewいっぱい表示
  * fit: 表示可能範囲内でratioを維持したまま表示。

### Imageのサイズについて

```swift
Image(.demoItem)
    .resizable()
    .scaledToFill()
    .frame(height: 200)
```

  .resizable
にすることで親viewいっぱいにリサイズされたimageとなる。

.scaledToFill()
でそのスケールが適用される。

.frame(height: 200)
によってビューの描画範囲がきまる。画像のサイズよりframeの値が小さければ画像がはみ出る。

```swift
Image(.demoItem)
    .resizable()
    .frame(height: 200)
    .scaledToFill()
```

  .resizable
にすることで親viewいっぱいにリサイズされたimageとなる。

.frame(height: 200)
によってビューの描画範囲を更新する。このviewいっぱいにリサイズされたimageとなる。

.scaledToFill()
でそのスケールが適用される。

### Navigation バーの戻るボタンのカスタマイズ

```.swift
.navigationBarBackButtonHidden()
.toolbar {
    ToolbarItem(placement: .topBarLeading) {
      ~
    }
}
```

で戻るボタンを任意のViewで置き換えることができるが、hiddenを使っているのでエッジスワイプができない。

https://forums.developer.apple.com/forums/thread/662510

この場合以下のようなgesture検知を使うことで代替はできる。

```.swift
extension View {
    public func onEdgeSwipe(_ action: @escaping () -> Void) -> some View {
        self.highPriorityGesture(
            DragGesture(minimumDistance: 40)
                .onChanged { value in
                    if value.startLocation.x < 50 {
                        action()
                    }
                }
        )
    }
}
```

### Radius付きのボーダー

```.swift
.background {
  RoundedRectangle(cornerRadius: 12)
    .stroke(Color.black, lineWidth: 2)
}
```

### Viewのサイズ指定

* パディングを利用: Viewの周りに適切なパディングを設定することで、他の要素との関係性を明確にする。
* 固定サイズの最小限の使用: デザインの必要性に応じて最小限に固定サイズを使用し、コンテンツの読みやすさや操作のしやすさを確保する。

これにより、異なるデバイスや画面サイズに跨っても一貫性のあるレイアウトを維持できる。

### Viewの分け方

body 内が肥大化して可読性が落ちるのを防ぐために一部を分けることがあるが、  
対象のViewが複数の表示状態をもったり、複数のケースで表示検証したい場合 = preview を使いたい場合は `struct`、  
それ以外はチームの方針に合わせて `func` や computed property にするのが良さそう。

`struct` にする場合は stateless で最小限のプロパティを持つ View にしておくとプレビューが楽。
entity を丸ごと渡してるとそのモックを作らないといけないし、そういうentityは他でも使ってるのでmockを柔軟にする必要がある。

### Preview

- Previewがクラッシュした際はログには詳細がでないので、アラートから詳細確認画面に遷移しクラッシュしたスレッドの情報を見ることで原因がわかる

### ViewModifierの設定順序

[ViewModifier](https://developer.apple.com/documentation/swiftui/viewmodifier) はViewに追加の設定を行いその結果を返却する。
従って上から順に設定される。

### [SwiftUIでSingle Source of Truthを達成するための実装方針](https://blog.smartbank.co.jp/entry/2022/12/06/swiftui-single-source-of-truth)

Viewをステートレスに保ち、状態の流れを単方向にすることのメリット

> - Single Source of Truthの達成
>   - 状態を複製するのではなく移動させることで、Single Source of Truthを達成することができます。状態の不整合の発生を防ぎやすくなり、バグを防ぐのに役立ちます。
> - 再利用性の向上
>   - 他画面でのViewの使い周しが容易になります。
> - 処理の割り込みが可能
>   - 親Viewは子Viewの状態の変更前に処理を挟むことが可能で、状態を変更するかイベントを無視するかの判断が可能になります。
> - Previewの表示が容易
>   - ViewModelのような大きな状態管理オブジェクトを渡さないことで、Previewを表示する際に用意するパラメータが少なく済みます。

やり方

* Viewの状態を表現する情報源を1箇所に集約する

  * ```swift
    enum ProfileEditUIState {
        case initial
        case loading
        case editing(profile: Profile)
        case saving(profile: Profile)
        case error(Error)
    
        var isSaveButtonDisabled: Bool {
            switch self {
            case .initial, .loading, .error: return false
            case .editing(let profile): return profile.name.isEmpty
            case .saving: return true
        }
    }
      
    @MainActor
    class ProfileEditViewModel: ObservableObject {
        @Published private(set) var uiState: ProfileEditUIState = .initial
        ...
    }
    ```

* ステートレスなView

  * 切り出したViewにViewModelを渡すなどして、状態を持たないようにする

    * Bindingを利用している箇所については、`Binding.init(get:set:) ` とViewModelへのイベント伝播を利用することで実現できる。

    * ```swift
      struct ProfileEditScreen: View {
          ...
          var body: some View {
              ZStack {
                  ...
                  case .editing(let profile), .saving(let profile):
                      ProfileEditContent(
                          profile: profile,
                          isSaveButtonDisabled: viewModel.uiState.isSaveButtonDisabled,
                          onNameChanged: { name in
                              // 🙆 ViewModelへテキスト変更イベントを伝播
                              viewModel.onNameChanged(name: name)
                          },
                          onSaveButtonTapped: {
                              Task {
                                  await viewModel.onSaveButtonTapped()
                              }
                          }
                      )
                  ...
                  }
              }
              ...　　　　　
          }
      }
      
      private struct ProfileEditContent: View {
          let profile: Profile
          let isSaveButtonDisabled: Bool
          let onNameChanged: (String) -> Void
          let onSaveButtonTapped: () -> Void
      
          var body: some View {
              VStack {
                  TextField(
                      "Your Name",
                      text: .init(get: {
                          // 🙆 getterでは表示するテキストを返す
                          profile.name
                      }, set: { newValue in
                          // 🙆 setterではイベントを親Viewへ伝播する
                          onNameChanged(newValue)
                      })
                  )
                          ...
              }
          }
      }
      
      @MainActor
      class ProfileEditViewModel: ObservableObject {
          @Published private(set) var uiState: ProfileEditUIState = .initial
          ...
          // 🙆 UIStateを更新
          func onNameChanged(name: String) {
              guard case .editing(var profile) = uiState else { return }
      
              profile.name = name
              uiState = .editing(profile: profile)
          }
      }
      ```

また、「複数のNavigationの管理は一箇所にまとめる」ことで遷移先が増えた場合の状態管理コストを下げることもできる。

### SwiftUI 利用時の Property Wrapper 選択フローチャート

![property_wrapper_for_swiftUI](https://user-images.githubusercontent.com/20992687/120320715-7176a180-c31d-11eb-893d-cf305e6fe931.jpg)
[引用: SwiftUI のデータ管理 Property Wrapper 編](https://blog.personal-factory.com/2021/01/23/how-to-use-propertywrapper-in-swiftui/)

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

### Extension vs View vs Modifier

View を拡張したい場合は extension を使用し、状態保持が必要な場合は View の作成や ViewModifier を検討する。

View か Modifierかは、

> On the flip side, if all that we’re doing is applying a set of styles to a single view, then implementing that as either a “modifier-like” extension, or using a proper ViewModifier type, will most often be the way to go. And for everything in between — such as our earlier “featured label” example — it all really comes down to code style and personal preference as to which solution will be the best fit for each given project.
> 
> Just look at how SwiftUI’s built-in API was designed — containers (such as HStack and VStack) are views, while styling APIs (such as padding and foregroundColor) are implemented as modifiers. So, if we follow that same approach as much as possible within our own projects, then we’ll likely end up with UI code that feels consistent and inline with SwiftUI itself.

View: コンテナーとして機能するようなものである場合にViewとした方がViewの階層の可読性は良い。例えばカードUIの表示については下記のようにすると分かりやすい。

```.swift
Card {
  Text("Hello World")
}
```

[A Girl and her @ViewBuilder | Amy is a cute iOS Developer](https://cuteios.dev/2024/01/10/viewbuilder.html)

Modifire: 単一のViewに対してのスタイルの適用をしたいのであればこれで十分

それ以外は好み。

* [SwiftUI views versus modifiers | Swift by Sundell](https://www.swiftbysundell.com/articles/swiftui-views-versus-modifiers/)
* [View を拡張したい場合は原則として extension を使用し、状態保持が必要な場合のみ `ViewModifier` を実装する。 · YusukeHosonuma/Effective-SwiftUI · Discussion #31](https://github.com/YusukeHosonuma/Effective-SwiftUI/discussions/31)

### 余白

> 要素間の余白はVStack/HStackの spacing を用いて表現する.  
> 要素の配置によって生じる余白は .frame(maxWidth:maxHeight:) を用いて表現する.  
> 要素外側の余白は、どの要素が持つべき余白であるかを意識して padding を用いて表現する

[SwiftUIのlayoutシステム](https://shtnkgm.com/blog/2023-04-05-swiftui-layout.html)

### GeometryReader

親Viewのサイズや位置にアクセスできるようにするView。
これを利用することで相対サイズの指定も可能になる。

SwiftUIのレイアウトの3ステップは下記であり、
1. 親が子のサイズを提案
2. 子はそれを使用して自分のサイズを決定
3. 親は子を適切な位置に配置

`GeometryReader` より受け取れる `GeometryProxy` は 提案されたサイズを保持している。  
保持しているプロパティは以下の通り。

```swift
    /// The size of the container view.
    public var size: CGSize { get }

    /// Resolves the value of `anchor` to the container view.
    public subscript<T>(anchor: Anchor<T>) -> T { get }

    /// The safe area inset of the container view.
    public var safeAreaInsets: EdgeInsets { get }

    /// Returns the container view's bounds rectangle, converted to a defined
    /// coordinate space.
    public func frame(in coordinateSpace: CoordinateSpace) -> CGRect

```

`frame(in:)` で特定の座標空間での座標を取得できる。

* `.global`: Viewが画面上のどこにあるか知りたい場合
* `.local`: Viewの親に対する相対位置を知りたい場合
* `.coordinateSpace(name:`: 他のViewに対する相対位置を知りたい場合

[Understanding frames and coordinates inside GeometryReader - a free Hacking with iOS: SwiftUI Edition tutorial](https://www.hackingwithswift.com/books/ios-swiftui/understanding-frames-and-coordinates-inside-geometryreader#:~:text=SwiftUI's%20GeometryReader%20allows%20us%20to,most%20remarkable%20effects%20in%20SwiftUI.)

### AttributedString を利用してURLを処理する

AttributedString を用いて markdown をレンダリングすることが可能だが、

[Instantiating Attributed Strings with Markdown Syntax | Apple Developer Documentation](https://developer.apple.com/documentation/foundation/attributedstring/instantiating_attributed_strings_with_markdown_syntax)

それがリンクを含む場合、そのハンドリングは以下のように行うことができる

```.swift
@Environment(\.openURL) var openURL

var body: .......

Text(someAttributedStringWithLink)         
     .environment(\.openURL, OpenURLAction { url in
           print(url) // do what you like
           return .handled  // compiler won't launch Safari
    })
```

[SwiftUI AttributedString handle li… | Apple Developer Forums](https://developer.apple.com/forums/thread/720669)

### SwiftUIのレンダリングループ

* SwiftUIはUIKitと同様にCFRunLoop上に構築されたイベントループを使用
* ビューのbody評価とスクリーンレンダリングは異なるタイミングで実行される
* @Stateなどの変更によりビューが無効化されても、即座にbody評価は行われない
* body評価はCFRunLoopのbeforeWaitingステージでrun loop observerにより実行される
* 同一run loop内で複数回ビューが無効化されても、body評価は1回のみ
* onAppearやonChangeハンドラーは初回body評価後に呼ばれ、これらが再度ビューを無効化する可能性がある
* 2回目のbody評価が必要な場合でも、最初のbodyは画面にレンダリングされない（CATransactionがコミットされていないため）
* Core AnimationのCATransactionにより実際の画面描画が管理される
* 暗黙的なCATransactionは run loop cycleの最後にコミットされる
### Core Animation

[深く知りたい Core Animation まとめ 1（レイヤー編）【iOS / Swift】 - SNOOZE LOG](https://snoozelag.hatenablog.com/entry/2021/12/18/003933)

## UX

- エラーメッセージでは「どうやったら」回復するかを示す
  - エラーメッセージを出す目的はユーザーに異常であることのフィードバックを伝えることであり、その後にユーザーが望むのはその状態からの回復である
- 先に要素があることを少し見せる
  - コンテンツの端を少し見せることでユーザーがスクロールして追加コンテンツを見つけやすくできる
- 一覧から項目を押して詳細画面に遷移する場合は戻るまで一覧のハイライトを残す
  - ユーザーが前にどの項目をみたか、ということに意識を割くことを防げる
  - [UITableView の UX 改善(今すぐ出来る！)](https://qiita.com/trsxxii/items/8f71ca67da4c6f4b78d2)
 
## WebView

WebViewのCookieが消える問題があるようなので、消えた時に復元するロジックを入れておくのが良さそう

[Synchronization of native and WebView sessions with iOS | by Paul Hackenberger | Axel Springer Tech | Feb, 2024 | Medium](https://medium.com/axel-springer-tech/synchronization-of-native-and-webview-sessions-with-ios-9fe2199b44c9)

## WebKit

Apple は iOS プラットフォーム上において WebKit 以外のブラウザエンジンを禁止している。  
そして WebKit はアプリケーションというよりかは「コンテンツエンジン」としての役割を担うことを目的としている。つまり、ネイティブアプリと同じような機能を WebKit ベースで実現することが難しくなるのも当然。  
一方で Blink のミッションは「Web を世界の情報を体験するための最高のプラットフォームにし、世界で最も優れた Web プラットフォームの実装を提供する」というもの。その意味するところは、Blink が自社のエンジンをネイティブアプリと直接競合させ、コンシューマ向けインターネットの「最高のプラットフォーム」になることを望んでいる。実際に Android 上で動作する最新の PWA は、Android のネイティブアプリと[同じくらい優れた](https://web.dev/app-like-pwas/)ユーザ・エクスペリエンスを提供するようになってきている。  
iOS ではブラウザエンジンの選択肢がないだけでなく、WebKit 自体がブラウザエンジンとして不十分だということです。現在、Microsoft Edge のパートナー・プログラム・マネージャーを務め、その前は Google Chrome のシニアエンジニアとして長年活躍してきたる[アレックス・ラッセル](https://twitter.com/slightlylate)は、[Apple の Web に対するアプローチ](https://infrequently.org/2021/08/webkit-ios-deep-dive/)について多くのことを書いている。彼はまだ Google に在籍していた頃、[WebKit に対する長い評論](https://infrequently.org/2021/04/progress-delayed/)を発表し、「Apple の Web エンジンは、互換性と機能の両方で一貫して他のエンジンを遅れをとっており、その結果、Apple のネイティブ・プラットフォームとの間には大きなギャップが持続している」と結論付けた。

[ブログ: Apple のブラウザエンジン禁止は、Web アプリのイノベーションを妨げている](https://okuranagaimo.blogspot.com/2021/09/appleweb.html)

## WKWebView vs SFSafariViewController

[Appにおけるウェブビューを実現するには、WKWebViewとSFSafariViewControllerのどちらを使うべきですか - 見つける - Apple Developer](https://developer.apple.com/jp/news/?id=trjs0tcd)

## Asset Catalog

* 「Preserve Vector Data」オプションを有効にすると、ベクターベースの画像（PDFファイルとして追加された画像など）をアプリに組み込む際に、そのベクターデータを保持する。これにより、アプリが実行されるデバイス上で、必要に応じて画像を適切な解像度にスケーリングできるようになる。通常、ベクター画像はビルド時に特定の解像度のビットマップ画像に変換されるがこのオプションを利用することでそれが不要になる。ビルド時に生成される画像よりも大きく、または小さく表示したい場合に有効。

## String Catalog

URLリンクをString内に含めるときはString Catelogでマークダウンを定義すると便利。（AttributedStringより楽）

valueの例

"This is markdown **[Link](%1$@)** ."

## UserDefaultsの内容確認

simulator  

`find ~/Library/Developer/CoreSimulator/Devices -name {bundle id}.plist -print`

で出力される中から該当のsimulatorのidのものを見に行けばよい

## Xcode のショートカット

* 別のエディターにフォーカスを切り替える: Control + @

## Xcode 関連のコマンド

Swift Package で追加したライブラリのパス

```
export SPM_ROOT=${BUILD_DIR%Build/*}SourcePackages/checkouts
```

環境変数とその値の確認

```
xcodebuild -project [プロジェクトディレクトリ] -target [対象target] -showBuildSettings
xcodebuild -workspace [ワークスペースディレクトリ] -scheme [対象scheme] -showBuildSettings
```

有効になっているいる Command Line Tools のパス

```
xcode-select -p
```

Command Line Tools の切り替える

```
sudo xcode-select -s /Applications/Xcode-12.0.0.app
```

利用できる SDK 一覧

```
xcodebuild -showsdks
```

利用できるシミュレータ一覧

```
xcrun simctl list devicetypes
```

シミュレータで Deep Link を試す

```
xcrun simctl openurl booted 'URL'
```

## Xcodeで作成するファイルでヘッダーコメントをなくす

* 例えば、 `/Applications/Xcode-15.0.0.app/Contents/Developer/Library/Xcode/Templates/File Templates/MultiPlatform` にファイルテンプレートがあるので、Swiftのものをコピペしヘッダーコメントがないswiftファイルを作成しそれに置き換える。

## Xcode デバッグについて

* [Advanced Debugging with Xcode and LLDB - WWDC18 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2018/412 )
サンプルアプリ使いながら実演しつつ説明してくれて分かりやすい
* [LLDBデバッガで不具合の原因を特定して開発速度を上げよう by クウルス | トーク | iOSDC Japan 2019 #iosdc - fortee.jp](https://fortee.jp/iosdc-japan-2019/proposal/e04ea30b-0363-4fe9-8501-841ed3261918 )

## Xcode のビルド結果出力先

`Xcode -> Preferences -> Locations -> Derived Data` に設定されている場所に出力される。

デフォルトは `/Users/(ユーザー名)/Library/Developer/Xcode/DerivedData/`

## Xcode のビルド設定項目

[Build Settings Reference | Apple Developer Documentation](https://developer.apple.com/documentation/xcode/build-settings-reference)

## CocoaPods

* [CocoaPods] podfile内でローカルの podspec を参照する
`pod 'Demolivery', :podspec => "../development/Demolivery.podspec"`

* [CocoaPods] podspecファイル内でローカルの podspec を参照する
`spec.source = { :git => "file:///Users/{user name}/Desktop/{directory name}" }`

## Core Data

### fault

> *フォルトは、*アプリケーションが消費するメモリの量を減らします。フォルトは、まだ完全には実現されていない管理オブジェクトを表すプレースホルダー オブジェクト、または関係を表すコレクション オブジェクトです。
>
> - 管理対象オブジェクトのフォルトは適切なクラスのインスタンスですが、その永続変数はまだ初期化されていません。
> - リレーションシップ フォールトは、リレーションシップを表すコレクション クラスのサブクラスです。
>
> フォルトにより、Core Data はオブジェクト グラフに境界を設定できます。障害が認識されないため、管理対象オブジェクトの障害が消費するメモリが少なくなり、障害に関連する管理対象オブジェクトをメモリに表示する必要がまったくなくなります。

* [Core Data Programming Guide: Faulting and Uniquing](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/FaultingandUniquing.html)
* [What Is a Core Data Fault](https://cocoacasts.com/what-is-a-core-data-fault)

### fetched properties

> フェッチされたプロパティの効果は、フェッチ リクエストを自分で実行し、結果を一時的な属性に配置するのと似ていますが、フレームワークが詳細を管理します。特に、フェッチされたプロパティはリクエストされるまでフェッチされず、オブジェクトがフォルトになるまで結果がキャッシュされます。

[NSFetchedPropertyDescription | Apple Developer Documentation](https://developer.apple.com/documentation/coredata/nsfetchedpropertydescription)

### Field 'recordName' is not marked queryable

CloudKit Databaseにおいて"Query Records"を実行した際に上記エラーがでることがある。
これはindexにrecordNameを追加すれば解決する

[How to fix “Field ‘recordName’ is not marked queryable” in CloudKit – Elaine Lyons](https://lyons.app/2021/07/05/how-to-fix-field-recordname-is-not-marked-queryable-in-cloudkit/)

### FetchRequest

Core Dataからデータ取得してそれをSwiftUIで扱うためのProperty Wrapper

> A property wrapper type that retrieves entities from a Core Data persistent store.

[What is the @FetchRequest property wrapper? - a free SwiftUI by Example tutorial](https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-fetchrequest-property-wrapper)

### Databaseの種類

* Public: アプリ利用者全員がアクセス可能
* Private: AppleIDに紐づいた特定ユーザのみがアクセス可能
* Shared: 他の特定の iCloud ユーザーがアクセス可能

> Core Data with CloudKit uses a specific record zone in the CloudKit private database, which is accessible only to the current user.
> 
> (訳)
> CloudKit を使用した Core Data は、現在のユーザーのみがアクセスできる CloudKit プライベート データベース内の特定のレコード ゾーンを使用します。

### Core DataとCloudKitの連携

何が嬉しいか

* 複数端末で同期できる
* 機種変更の際の復元が比較的楽
* 特定のユーザー（apple ID）と共有できる

>  CloudKit does not support unique constraints, undefined attributes, or required relationships.

https://developer.apple.com/documentation/coredata/mirroring_a_core_data_store_with_cloudkit/creating_a_core_data_model_for_cloudkit が詳しい

プッシュ通知を利用してCloudKitの変更をCoreDataに伝えている

#### CloudKitへ同期するかしないかを切り替える

NSPersistentCloudKitContainerを生成し、`storeDescription.cloudKitContainerOptions = nil`と設定すれば良さそう。

https://developer.apple.com/forums/thread/695714  
→ 再起動しないと他のデバイスからの同期が機能しない。バグ？

https://stackoverflow.com/questions/65355720/coredatacloudkit-on-off-icloud-sync-toggle  
→ この方法も問題があると言及している

configurationを作成する方法も考えられる。

* Cloudオン時
  * CloudのDBから参照するようにする
* Cloudオフ時
  * LocalのDBから参照するようにする

同じエンティティを複数のConfigurationで管理した場合、データ差異があったらどうなるんだろう？
基本的には同じ（ミラー）となる前提だとは思う、つまりこの方式の場合単純にデータ量が2倍になる？

### 参考

* [Core Data | Apple Developer Documentation](https://developer.apple.com/documentation/coredata)
* [Using Core Data With CloudKit](https://developer.apple.com/videos/play/wwdc2019/202)
  * Core Data With CloudKitの基本的な話。
* https://developer.apple.com/videos/play/wwdc2021/10015
  * 複数の iCloud ユーザー間でデータを共有するアプリについて
  * NSPersistentCloudKitContainerを用いた[サンプルアプリ](https://developer.apple.com/documentation/coredata/synchronizing_a_local_store_to_the_cloud)の動作を知るために役立つ
* https://developer.apple.com/videos/play/wwdc2022/10119/a
  * CoreData、CloudKitの最適化の話。検証/テスト、チェック、デバッグ etc.
* https://developer.apple.com/videos/play/wwdc2020/10650/
  * パブリックなデータ保存場所としてCloudKitを利用する
* https://zenn.dev/treastrain/articles/9db1ac5fb17904

## Locale

Locale = 言語（Language） + 地域（Region）

[Locale識別子の例]
en_US（英語＋米国地域）
ja_JP（日本語＋日本地域）
en_JP（英語＋日本地域）
Fr_FR（フランス語＋フランス地域）

地域（Region）は端末の情報が取得されますが、言語（Language）についてはそのアプリが対応しているローカライズ言語と、端末の「使用する言語の優先順位」の中で一致する最上位の言語が採用される。Xcodeで新規作成したプロジェクトでは、通常ローカライズ言語に登録されているのはEnglishのみなので、端末のロケール設定を「日本語」＋「日本地域」にしても、アプリ側で取得できるLocale情報は”en_JP”となる。

下記のようにして`preferredLanguages` から `Locale` を作り直すと`languageCode` や `regionCode` の設定値を取得可能。

```swift
extension Locale {
    static var appLanguageLocale: Locale {
        if let languageCode = Locale.preferredLanguages.first {
            return Locale(identifier: languageCode)
        } else {
            return Locale.current
        }
    }
}
```

もしくは各 Localizable.strings にkeyを設定してそれを取得することも可能。

```
"key" = "ja";
"key" = "en";
```

## StoreKit

https://www.revenuecat.com/blog/engineering/ios-in-app-subscription-tutorial-with-storekit-2-and-swift-jp/

## WKNavigationDelegate

* decidePolicyForNavigationAction:decisionHandler:
ナビゲーションを許可またはキャンセルするかを決定する。
* decidePolicyForNavigationResponse:decisionHandler:
レスポンスを確認した後に、ナビゲーションを許可またはキャンセルするかを決定する。
* didStartProvisionalNavigation:
ナビゲーションが開始されたときに呼び出される。
* didReceiveServerRedirectForProvisionalNavigation:
サーバーリダイレクトを受信したときに呼び出される。
* didFailProvisionalNavigation:withError:
データ読み込み開始時にエラーが発生したときに呼び出される。
* didCommitNavigation:
コンテンツの受信が開始されたときに呼び出される。
* didFinishNavigation:
ナビゲーションが完了したときに呼び出される。
* didFailNavigation:withError:
コミットされたメインフレームのナビゲーション中にエラーが発生したときに呼び出される。
* didReceiveAuthenticationChallenge:completionHandler:
認証チャレンジを受けたときに呼び出される。
* webViewWebContentProcessDidTerminate:
Webコンテンツプロセスが終了したときに呼び出される。
* authenticationChallenge:shouldAllowDeprecatedTLS:
廃止されたTLSバージョンを使用するネットワーク接続を確立しているときに呼び出される。
* navigationAction:didBecomeDownload:
ナビゲーションアクションがダウンロードに変わったときに呼び出される。
* navigationResponse:didBecomeDownload:
ナビゲーションレスポンスがダウンロードに変わったときに呼び出される。

## Appleが公開しているURLスキーム

* https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/Introduction/Introduction.html#//apple_ref/doc/uid/TP40007899
* UIApplicationOpenURLOptionsKey
* the specific case described in QA1924 Opening Keyboard Settings from a Keyboard Extension [This Q&A has been retired.]

## Blogs

* [Hacking with Swift – learn to code iPhone and iPad apps with free Swift tutorials](https://www.hackingwithswift.com/)
  * 言わずと知れた
  * 広範なトピック
* [Home | Swift with Majid](https://swiftwithmajid.com/)
* [Articles | AzamSharp](https://azamsharp.com/articles)
  * [Stop using MVVM for SwiftUI](https://developer.apple.com/forums/thread/699003) の人

## TIPs

* 「Unable to boot the Simulator.」　でシミュレーターが起動しない
　　* mac のストレージ管理 > デベロッパ > キャッシュ関連を消してみる
   * Xcode Caches, Project Build Data and Indexes
* 特定の Location からそのタイムゾーンを知るには
  *  [CLGeocoder](https://developer.apple.com/documentation/corelocation/clgeocoder) の使用
  *  GCP の API
  *  ・・・

## Archived

<details>

<summary> デバイスと CPU アーキテクチャとチップ </summary>

| アーキテクチャ                                | チップ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 32/64bit | 端末                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| :-------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [ARMv7](https://en.wikipedia.org/wiki/ARMv7)  | [A4](https://en.wikipedia.org/wiki/Apple_A4)<br />[A5](https://en.wikipedia.org/wiki/Apple_A5)<br />[A5X](https://en.wikipedia.org/wiki/Apple_A5X)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |  32bit   | iPhone 4<br/>iPhone 4S<br />iPad (1st generation)<br/>iPad 2 (iPad2,1; iPad2,2; iPad2,3; iPad2,4)<br/>iPad (3rd generation)<br />iPad Mini (1st generation)<br />iPod Touch (4th generation)<br/>Apple TV (2nd generation)<br />Apple TV (3rd generation)<br/>iPod Touch (5th generation)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| [ARMv7s](https://en.wikipedia.org/wiki/ARMv7) | [A6](https://en.wikipedia.org/wiki/Apple_A6)<br /> [A6X](https://en.wikipedia.org/wiki/Apple_A6X)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |  32bit   | iPhone 5<br />iPhone5C<br />iPad (4th generation)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ARMv8 系                                      | [A7](https://en.wikipedia.org/wiki/Apple_A7)<br />[A8](https://en.wikipedia.org/wiki/Apple_A8)<br />[A8X](https://en.wikipedia.org/wiki/Apple_A8X)<br />[A9](https://en.wikipedia.org/wiki/Apple_A9)<br />[A9X](https://en.wikipedia.org/wiki/Apple_A9X)<br />[A10 Fusion](https://en.wikipedia.org/wiki/Apple_A10)<br />[A10X Fusion](https://en.wikipedia.org/wiki/Apple_A10X)<br />[A11 Bionic](https://en.wikipedia.org/wiki/Apple_A11)<br />[A12 Bionic](https://en.wikipedia.org/wiki/Apple_A12)<br />[A12X Bionic](https://en.wikipedia.org/wiki/Apple_A12X)<br />[A12Z Bionic](https://en.wikipedia.org/wiki/Apple_A12Z)<br />[A13 Bionic](https://en.wikipedia.org/wiki/Apple_A13)<br />[A14 Bionic](https://en.wikipedia.org/wiki/Apple_A14) |  64bit   | iPhone 5S<br/>iPhone 6<br/>iPhone 6 Plus<br/>iPhone 6S<br/>iPhone 6S Plus<br/>iPhone SE (1st generation)<br/>iPhone 7<br/>iPhone 7 Plus<br/>iPhone 8<br/>iPhone 8 Plus<br/>iPhone X<br />iPhone XS<br/>iPhone XS Max<br/>iPhone XR<br/>iPhone 11<br/>iPhone 11 Pro<br/>iPhone 11 Pro Max<br/>iPhone SE (2nd generation)<br />iPhone 12<br/>iPhone 12 mini<br/>iPhone 12 Pro<br/>iPhone 12 Pro Max<br />iPod Touch (6th generation)<br/>iPod Touch (7th generation)<br/>iPad (5th generation)<br />iPad (6th generation)<br/>iPad (7th generation)<br />iPad (8th generation)<br />iPad Pro (9.7-inch)<br />iPad Pro (10.5-inch)<br/>iPad Pro (12.9-inch) (1st generation)<br/>iPad Pro (12.9-inch) (2nd generation)<br/>iPad Pro (12.9-inch) 3rd generation)<br />iPad Pro (12.9-inch) (4th generation)<br />iPad Pro (11-inch) (1st generation)<br/>iPad Pro (11-inch) (2nd generation)<br/>iPad Mini 2<br/>iPad Mini 3<br />iPad Mini 4<br/>iPad Mini (5th generation)<br/>iPad Air (1st generation)<br />iPad Air (3rd generation)<br/>iPad Air (4th generation)<br />iPad Air 2<br />Apple TV HD<br/>Apple TV 4K<br />HomePod<br /> |

（端末によっては複数のチップを含みますが、ここでは A シリーズのチップ（モバイル・コンピューティング機能を提供するために必要な電子機器を 1 つの物理的なパッケージに統合しているチップ）について記載しています。）

### 参考

- [Apple A5 - Wikipedia](https://ja.wikipedia.org/wiki/Apple_A5)
- [Apple A6 - Wikipedia](https://ja.wikipedia.org/wiki/Apple_A6)

</details>
