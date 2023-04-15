## キャリア

- [Why iOS Developers Feel Stuck In Their Careers & What To Do — Essential Developer](https://www.essentialdeveloper.com/articles/why-ios-developers-feel-stuck-in-their-careers-and-what-to-do)

## デバイスと CPU アーキテクチャとチップ

| アーキテクチャ                                | チップ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 32/64bit | 端末                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| :-------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [ARMv7](https://en.wikipedia.org/wiki/ARMv7)  | [A4](https://en.wikipedia.org/wiki/Apple_A4)<br />[A5](https://en.wikipedia.org/wiki/Apple_A5)<br />[A5X](https://en.wikipedia.org/wiki/Apple_A5X)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |  32bit   | iPhone 4<br/>iPhone 4S<br />iPad (1st generation)<br/>iPad 2 (iPad2,1; iPad2,2; iPad2,3; iPad2,4)<br/>iPad (3rd generation)<br />iPad Mini (1st generation)<br />iPod Touch (4th generation)<br/>Apple TV (2nd generation)<br />Apple TV (3rd generation)<br/>iPod Touch (5th generation)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| [ARMv7s](https://en.wikipedia.org/wiki/ARMv7) | [A6](https://en.wikipedia.org/wiki/Apple_A6)<br /> [A6X](https://en.wikipedia.org/wiki/Apple_A6X)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |  32bit   | iPhone 5<br />iPhone5C<br />iPad (4th generation)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ARMv8 系                                      | [A7](https://en.wikipedia.org/wiki/Apple_A7)<br />[A8](https://en.wikipedia.org/wiki/Apple_A8)<br />[A8X](https://en.wikipedia.org/wiki/Apple_A8X)<br />[A9](https://en.wikipedia.org/wiki/Apple_A9)<br />[A9X](https://en.wikipedia.org/wiki/Apple_A9X)<br />[A10 Fusion](https://en.wikipedia.org/wiki/Apple_A10)<br />[A10X Fusion](https://en.wikipedia.org/wiki/Apple_A10X)<br />[A11 Bionic](https://en.wikipedia.org/wiki/Apple_A11)<br />[A12 Bionic](https://en.wikipedia.org/wiki/Apple_A12)<br />[A12X Bionic](https://en.wikipedia.org/wiki/Apple_A12X)<br />[A12Z Bionic](https://en.wikipedia.org/wiki/Apple_A12Z)<br />[A13 Bionic](https://en.wikipedia.org/wiki/Apple_A13)<br />[A14 Bionic](https://en.wikipedia.org/wiki/Apple_A14) |  64bit   | iPhone 5S<br/>iPhone 6<br/>iPhone 6 Plus<br/>iPhone 6S<br/>iPhone 6S Plus<br/>iPhone SE (1st generation)<br/>iPhone 7<br/>iPhone 7 Plus<br/>iPhone 8<br/>iPhone 8 Plus<br/>iPhone X<br />iPhone XS<br/>iPhone XS Max<br/>iPhone XR<br/>iPhone 11<br/>iPhone 11 Pro<br/>iPhone 11 Pro Max<br/>iPhone SE (2nd generation)<br />iPhone 12<br/>iPhone 12 mini<br/>iPhone 12 Pro<br/>iPhone 12 Pro Max<br />iPod Touch (6th generation)<br/>iPod Touch (7th generation)<br/>iPad (5th generation)<br />iPad (6th generation)<br/>iPad (7th generation)<br />iPad (8th generation)<br />iPad Pro (9.7-inch)<br />iPad Pro (10.5-inch)<br/>iPad Pro (12.9-inch) (1st generation)<br/>iPad Pro (12.9-inch) (2nd generation)<br/>iPad Pro (12.9-inch) 3rd generation)<br />iPad Pro (12.9-inch) (4th generation)<br />iPad Pro (11-inch) (1st generation)<br/>iPad Pro (11-inch) (2nd generation)<br/>iPad Mini 2<br/>iPad Mini 3<br />iPad Mini 4<br/>iPad Mini (5th generation)<br/>iPad Air (1st generation)<br />iPad Air (3rd generation)<br/>iPad Air (4th generation)<br />iPad Air 2<br />Apple TV HD<br/>Apple TV 4K<br />HomePod<br /> |

（端末によっては複数のチップを含みますが、ここでは A シリーズのチップ（モバイル・コンピューティング機能を提供するために必要な電子機器を 1 つの物理的なパッケージに統合しているチップ）について記載しています。）

### 参考

- [Apple A5 - Wikipedia](https://ja.wikipedia.org/wiki/Apple_A5)
- [Apple A6 - Wikipedia](https://ja.wikipedia.org/wiki/Apple_A6)

## iOS とフレームワーク

> iOS + Swift の上でオープンソースのフレームワークを使うことは辞めた方が良いと思います。OS そのものが勢いよく進化しているので、フレームワークを使うメリットが少ないし、すぐに陳腐化してしまう可能性があります。ブラウザーの上で Vue や React などのフレームワークが意味を持つのは、ブラウザーそのものの開発環境が貧弱な上に、ブラウザーごとに細かな違いがあるからです。そこを勘違いしないように注意してください。

引用: 週刊 Life is Beautiful ２０２０年１２月２９日号

## iOS の基礎

- 公式チュートリアル: [iOS App Dev Tutorials | Apple Developer Documentation](https://developer.apple.com/tutorials/app-dev-training)

## iPhone の解像度

### （前提） ドットとピクセル

- ドット: 画像入出力装置において光の強弱を表現できる最小単位。
- ピクセル: 画像入出力装置においてカラー画像を表すための最小の単位。カラー画像を表すための最小単位なので、赤緑青の三つを合わせたものとなる。

よって、カラーを表現する際は 3 ドットが必要となる。
一方で白黒画像の場合はピクセルの概念は不要となる。

#### 入出力装置とドット/ピクセル

- 液晶モニター（2 枚のガラス板の間に液晶を入れ、電圧の変化によって画面を表示させるモニタ。[液晶モニターとは - コトバンク](https://kotobank.jp/word/%E6%B6%B2%E6%99%B6%E3%83%A2%E3%83%8B%E3%82%BF%E3%83%BC-11966)）
- - 赤青緑の 3 ドットで 1 ピクセルになる
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

### 参考

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

## LLDB

- 値の書き換え

`e self.isA = true`

- 任意の行数スキップ

`th j --by 1`

## NS Prefix

NS という接頭辞は Objective-C において名前空間が存在しなかったので、名前の衝突を避けるためにつけられていたものです。

### 参考

- [NS Prefix - そこから見渡す Swift 3 の景色 #startup_mobile](https://www.slideshare.net/tomohirokumagai54/ns-prefix-swift-3-startupmobile)
- [ios - What does the NS prefix mean? - Stack Overflow](https://stackoverflow.com/questions/473758/what-does-the-ns-prefix-mean)

## P12 証明書の中身の確認

`keytool -list -v -keystore {file_name}.p12 -storetype PKCS12 -storepass {password} `

## SwiftUI

### Views vs Modifiers

> On the flip side, if all that we’re doing is applying a set of styles to a single view, then implementing that as either a “modifier-like” extension, or using a proper ViewModifier type, will most often be the way to go. And for everything in between — such as our earlier “featured label” example — it all really comes down to code style and personal preference as to which solution will be the best fit for each given project.
> 
> Just look at how SwiftUI’s built-in API was designed — containers (such as HStack and VStack) are views, while styling APIs (such as padding and foregroundColor) are implemented as modifiers. So, if we follow that same approach as much as possible within our own projects, then we’ll likely end up with UI code that feels consistent and inline with SwiftUI itself.

View: コンテナーとして機能するようなものである場合にViewとした方がViewの階層の可読性は良い
Modifire: 単一のViewに対してのスタイルの適用をしたいのであればこれで十分

それ以外は好み。

[SwiftUI views versus modifiers | Swift by Sundell](https://www.swiftbysundell.com/articles/swiftui-views-versus-modifiers/)

## UIKit

- [深く知りたい Core Animation まとめ 1（レイヤー編）【iOS / Swift】 - SNOOZE LOG](https://snoozelag.hatenablog.com/entry/2021/12/18/003933)

## UX

- エラーメッセージでは「どうやったら」回復するかを示す
  - エラーメッセージを出す目的はユーザーに異常であることのフィードバックを伝えることであり、その後にユーザーが望むのはその状態からの回復である
- 先に要素があることを少し見せる
  - コンテンツの端を少し見せることでユーザーがスクロールして追加コンテンツを見つけやすくできる
- 一覧から項目を押して詳細画面に遷移する場合は戻るまで一覧のハイライトを残す
  - ユーザーが前にどの項目をみたか、ということに意識を割くことを防げる
  - [UITableView の UX 改善(今すぐ出来る！)](https://qiita.com/trsxxii/items/8f71ca67da4c6f4b78d2)

## WebKit

Apple は iOS プラットフォーム上において WebKit 以外のブラウザエンジンを禁止している。  
そして WebKit はアプリケーションというよりかは「コンテンツエンジン」としての役割を担うことを目的としている。つまり、ネイティブアプリと同じような機能を WebKit ベースで実現することが難しくなるのも当然。  
一方で Blink のミッションは「Web を世界の情報を体験するための最高のプラットフォームにし、世界で最も優れた Web プラットフォームの実装を提供する」というもの。その意味するところは、Blink が自社のエンジンをネイティブアプリと直接競合させ、コンシューマ向けインターネットの「最高のプラットフォーム」になることを望んでいる。実際に Android 上で動作する最新の PWA は、Android のネイティブアプリと[同じくらい優れた](https://web.dev/app-like-pwas/)ユーザ・エクスペリエンスを提供するようになってきている。  
iOS ではブラウザエンジンの選択肢がないだけでなく、WebKit 自体がブラウザエンジンとして不十分だということです。現在、Microsoft Edge のパートナー・プログラム・マネージャーを務め、その前は Google Chrome のシニアエンジニアとして長年活躍してきたる[アレックス・ラッセル](https://twitter.com/slightlylate)は、[Apple の Web に対するアプローチ](https://infrequently.org/2021/08/webkit-ios-deep-dive/)について多くのことを書いている。彼はまだ Google に在籍していた頃、[WebKit に対する長い評論](https://infrequently.org/2021/04/progress-delayed/)を発表し、「Apple の Web エンジンは、互換性と機能の両方で一貫して他のエンジンを遅れをとっており、その結果、Apple のネイティブ・プラットフォームとの間には大きなギャップが持続している」と結論付けた。

[ブログ: Apple のブラウザエンジン禁止は、Web アプリのイノベーションを妨げている](https://okuranagaimo.blogspot.com/2021/09/appleweb.html)

## WKWebView vs SFSafariViewController

[Appにおけるウェブビューを実現するには、WKWebViewとSFSafariViewControllerのどちらを使うべきですか - 見つける - Apple Developer](https://developer.apple.com/jp/news/?id=trjs0tcd)

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

## Xcode デバッグについて

* [Advanced Debugging with Xcode and LLDB - WWDC18 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2018/412 )
サンプルアプリ使いながら実演しつつ説明してくれて分かりやすい
* [LLDBデバッガで不具合の原因を特定して開発速度を上げよう by クウルス | トーク | iOSDC Japan 2019 #iosdc - fortee.jp](https://fortee.jp/iosdc-japan-2019/proposal/e04ea30b-0363-4fe9-8501-841ed3261918 )

## Xcode のビルド結果出力先

`Xcode -> Preferences -> Locations -> Derived Data` に設定されている場所に出力される。

デフォルトは `/Users/(ユーザー名)/Library/Developer/Xcode/DerivedData/`

## Xcode のビルド設定項目

[Build Settings Reference | Apple Developer Documentation](https://developer.apple.com/documentation/xcode/build-settings-reference)

## その他メモ

* [CocoaPods] podfile内でローカルの podspec を参照する
`pod 'Demolivery', :podspec => "../development/Demolivery.podspec"`

* [CocoaPods] podspecファイル内でローカルの podspec を参照する
`spec.source = { :git => "file:///Users/{user name}/Desktop/{directory name}" }`
