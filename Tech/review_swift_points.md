## 設計

* 新しくファイルを追加する場合、ファイルの追加場所は適当か
* 目的の修正と関係ないファイルが変更されていないか
  * 後から変更を履歴を追いたい時に不要な変更があると原因の特定が難しくなったりするため、そもそも意図しない変更以外はコミットしない方が良い。 
* ライブラリの導入理由が明確か
  * 定期的にメンテナンスがされているか。
  * ライセンスの問題はないか。
* テストコードが適切か
  * 最小値、最大値、境界値、無効値、（主な）パターンの網羅（同値分割）などが考慮されたテストコードになっているか

## 命名

* 修飾子が適切か
  * 定数/変数
  * アクセス修飾子
  * 継承可能化か
* ファイル名、クラス名が適切か
  * そのファイル名やクラス名を見ただけで役割が推測できるかどうか
* 変数/func名が適切か
  * [API Design Guidelines](https://swift.org/documentation/api-design-guidelines/#naming) に適した命名であるかどうか

## パフォーマンス

* 循環参照していないか
  * 特にクロージャーを使っている箇所で `self` が循環参照していないか。
* 高階関数を利用時にlazyを利用することで不必要な配列を生成しない
  * `let newCars = allCars.lazy.filter({$0.isNew})`  

## コーディングスタイル

* 複数要素を設定可能な場合は配列で記述し、複数のオプションが選択可能であることを示唆する
  * `accessQueue.sync(flags: [.barrier])`
* ifなどの条件部分が分かりにくい場合は変数化してその命名で意図を明確にする
  * また、分けることでそれぞれについてコメントを記載しやすい
* ID型などを作成して不要なインプットをさせない https://qiita.com/hicka04/items/a1a8c68f51e3edb23f0
* Unwrapping の使用が適切か
  * プロジェクトにもよるが、nilにならないケース（入力として数値のみしかあり得ない場合にStringをIntにキャストする場合や、viewDidLoadまでで値の存在が確定するもの）の場合はForced unwrappingを利用する。
* enumのrawvalueがintなら、その順に並べる

## デザイン

* 小さい画面の端末が考慮されているか
  * iPhone SE（640x1136）などの端末で実行した時に崩れたり、意図しない表示にならないか。
  * iPadを利用してSplit View機能を利用すると様々なサイズに変えやすくて便利。
    [iOSアプリ開発時のシミュレータはiPadを使うと便利 - star__hoshi's diary](https://starhoshi.hatenablog.com/entry/2022/04/05/082348)
* Dark Themeを導入していれば、Themeの切り替えで意図しない表示になっていないか

## その他

* ロジックはViewの内部で書くないようにすることでテスタブルにする
  * 表示用のプロパティを init で作るなどすることで Unit test でそのロジックのテストが可能
* (key, value) のようなタプルつくるなら KeyValuePairs を使用した方が型として明確
* テキスト入力可能画面では特定のキーボードを出していてもペーストが可能である場合意図しない文字列が入ることはあるので、入力可能な文字列を明確にし、それによってformatをかける
* closureにおいてそれが実行されてほしい場合がmain threadの場合、MainActorをつけることでUIを操作する処理の場合Actorを超えなくなり、awaitが不要となる
* 任意のcaseの中での処理が同じ場合、`case a, b, c:` のように書いてまとめることを検討する
* Text("", bundle: .module)、の bundle 以降を忘れてローカライズされてないがち
* デフォルト値が何かは分かりづらいので、明示的な値の設定をする
  * (SwifUI) `spacing` や `Spacer(minLength: 8)` を明示的に設定する
* 任意の設定が保証されるようにに、明示的な設定をする
  * (SwiftUI) Imageに`.renderingMode(.template)`と`resizable()`を追加しておく。画像のサイズが規定のサイズであったり、renderingModeはasset側で設定してあったりするので不要ではあるが、画像が差し替えになったケース等でasset側で正しい設定がなされていなかった場合に表示が崩れる可能性や、レビュー時にコードだけでは判断できないなどのデメリットがあるので基本追加する
* (SwiftUI) テキストが長い場合には `.multilineTextAlignment(.leading)`, `.fixedSize(horizontal: false, vertical: true)` の設定をする
* (SwiftUI) `ForEach` で id が不要な場合は宣言しなくても良い（シンプル）
  * `IdentifiedArrayOf` を使用している場合など

## 参考

* [ iOSアプリのコードレビューで見ているポイント 2020年5月版 ](https://cutmail.hatenablog.com/entry/2020/05/09/182304)
* [自分がコードレビューで気をつけていること（2020.5 iOSアプリ開発版 ）](http://curiosity.co.jp/review202005ios/)
