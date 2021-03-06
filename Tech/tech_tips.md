## 暗号化方式

共通鍵暗号と公開鍵暗号の2つがある。

| 暗号化方式         | 共通鍵暗号                       | 公開鍵暗号                           |
| ------------------ | -------------------------------- | ------------------------------------ |
| 暗号化アルゴリズム | RC4、DES、3DES、AES              | RSA、ElGamal                         |
| 使用する暗号鍵     | 共通鍵                           | 公開鍵、秘密鍵                       |
| 鍵の管理           | 通信接続先ごとに作成             | 通信接続先の数に関係なく１つだけ作成 |
| 鍵の交換           | 第三者に知られないよう安全に交換 | 作成した公開鍵を一般に公開           |
| データの処理時間   | 速い                             | 遅い                                 |

SSL/TLS通信では、このハイブリッド方式が「デジタル署名」と「デジタル証明書」の技術と組み合わせて使用される。

公開鍵暗号において、正しい公開鍵が使用されているかどうかの保証をするために認証局の発行したデジタル証明書を利用できる。

<img width="817" alt="認証局_デジタル証明書" src="https://user-images.githubusercontent.com/20992687/85192307-ff1fd380-b2fc-11ea-904a-08d038bc7382.png">

### 参考

* [ネットワークエンジニアとして](https://www.infraexpert.com/)

## 改行コード

* \n(LF)：Unix系OS全般、Mac OS X
* \r\n(CR+LF)：Windows系OS
* \r(CR)：古いMac OS（9以前）

## 画像形式

### ビットマップ画像

> ビットマップ画像とは、コンピュータグラフィックスにおける画像の表現形式で、ピクセルを用いたもの。画像をドットマトリクス状のピクセル群として捉え、RGB等の表色系に基づいたピクセルの色・濃度の値の配列情報として取り扱う。

 [ビットマップ画像 - Wikipedia](https://ja.wikipedia.org/wiki/ビットマップ画像)

### ベクター画像

> ベクター画像とは、画像データの表現形式の一つで、画像を図形を表す数値情報の集合として表現したもの。
> 画像を単純な図形の集合として表現する方式で、輪郭などを構成する点の位置や、それらを結ぶ直線や曲線を表す方程式のパラメータ、変形・回転など操作情報、線や面の色情報などの組み合わせとして記述する。

[ベクター画像（vector image）とは - IT用語辞典 e-Words](https://e-words.jp/w/%E3%83%99%E3%82%AF%E3%82%BF%E3%83%BC%E7%94%BB%E5%83%8F.html)

## カレンダー

* [Your calendrical fallacy is thinking…](https://yourcalendricalfallacyis.com/)
  * カレンダー関連の実装で気を付けるべきことが書かれている

## コードレビュー

### レビューの観点

*　レビュアー、レビュイーの技量や立場によって異なるが、下記のような観点がある
  * コーディング・スタイルやコードの読みやすさ
  * アルゴリズムやロジックの効率や正しさ
  * エラー処理
  * セキュリティ・ホール
  * データ隠蔽（公開範囲の制限）

レビューする人も人間なので、コードからバグをすべて見つけることは不可能。なので、「バグが出にくいコードになっているか？」という観点を意識するのが現実的。

### レビューの遅延

レビューが遅延すると、

* レビュワーのスイッチングコストの増加
* レビュイーがレビューを気にすることによるメモリ増加
* 他のタスクが依存している場合、その遅延

が発生する。  
レビュイーはコミットやプルリクエストにおいてレビューがしやすくなるような工夫し、レビュワーはなるべく早く対応するように心掛けるべき。

[On Code Review. In which the author makes a strong… | by Glen D Sanford | Medium](https://medium.com/@9len/on-code-review-16ea85f7c585)

## ディープリンク

* Custom URL Scheme

  * アプリ専用にSchemeをつくる

  * アプリがインストールされていないと、エラーが表示される。

  * 同じSchemeをもつアプリを複数インストールしていると、ハンドリングできない。

  * Warning

    * > URL schemeはアプリ内の潜在的な攻撃経路（attack vector）となるので、URLパラメータの全てを検証し、不正なURLは破棄してください。また、URL Schemeによって行えるアクションをユーザーのデータにリスクが無いように制限してください。例えば、他のアプリにコンテンツを削除させたり、ユーザーに関するセンシティブな情報にアクセスさせないことです。URLを処理するコードのテストを書く時は、不正なURLが含まれるテストケースが含まれていることを確認してください。

* Universal Links ( iOS ) と App Links ( Android )

  * 特定のURLでWebサイトにアクセスする際に、アプリをインストールしていればアプリ内の特定のコンテンツに遷移させ、インストールされていなければそのままWebサイトを表示、またはアプリストアに遷移させる仕組み
  * iOSとAndroidで要素技術が違うので、開発者は各OSに対応して実装を行う
    * iOSでの実装方法: [Allowing Apps and Websites to Link to Your Content | Apple Developer Documentation](https://developer.apple.com/documentation/xcode/allowing-apps-and-websites-to-link-to-your-content?preferredLanguage=occ)

* Firebase Dynamic Links

  * Firebase Dynamic Linksはディープリンク提供サービスであり、iOS・Android・PC共通で使えるディープリンクURLを作成・管理できる
  * Firebaseを使うことでディープリンクの導入が簡潔になり、OS間の差分を吸収してくれる
  * リンクを開いた後の挙動などの設定をFirebaseコンソールからGUIで簡単に操作できる

### 参考

* [アプリをURLで起動する](https://www.notion.so/URL-176950ae6f5241da892826148b66f601)
* [モバイルアプリにおけるディープリンクとメルカリShopsでの実装 | メルカリエンジニアリング](https://engineering.mercari.com/blog/entry/20220224-deeplink-for-mercari-shops/)

## テスト

### 仕様の記述

BDD によるテストコードでは「振る舞い」を表現するために次のように記載される

（前提）Given: 事前に準備する値の設定  
（いつ）When: 実行（実行のタイミング）  
（どうなるか）Then: 検証コード  

これは仕様の記述にも使える。

また、画面設計のときに書けばViewModelやPresenterのプロトコルを書きやすい
その際は下記のようになる

``` 
・Given （前提）
・When （どういう時に）
  アクション
  見ている箇所
・Then（どうなるか）
  どんなUIがあるか
  （実装時）どんなデータを使用するか
```

### ソフトウェアにおける品質の種類

* 外側の品質: 利用者から見た品質
  *  必要な機能が満たせているか 
  *  操作性は問題ないか
  *  画面の表示崩れは無いか
  *  クラッシュしないか
* 内側の品質: 開発者から見たソフトウェアの内部構造における品質
  * アーキテクチャやクラス設計は適切か
  * 利用しやすい API 設計になっているか
  * コードの可読性は保たれているか

「外側の品質」と「内側の品質」の担保について  

「あるべき振る舞いのテストを先に書く」ことで、最初になにを作るべきかを明確にし、外側からテストできる設計を考えるこ とを強制させることで「外側の品質」を支えられる。
「TDDプラクティス（RED → GREEN → Refactor）」を行うことで、最初に利用しやすい API を検討させ、リファクタリングによるコードの可読性や設計の改善により、「内側の品質」を支え ます。

### テストの保守性

* テストケース名をわかりやすくする

  * `test <テスト対象メソッド>_<テストの説明>`
  * テストレポートに情報として載る形式で記載するのがいい。 ほとんどのテスティングフレームワークではコメントを認識しないため、テストレポートからは情報として欠落してしまう

* テストを適切な粒度に保つ

  * テストケース名長くなったらそれは粒度大きい

* テストの構造をわかりやすくする

  * テストフィクスチャの定義をまとめる

* 失敗時のエラーメッセージをわかりやすくする

  * ```swift
    XCTAssertNil(rot13.encode("Hello!"),"文字列`Hello!`には記号である!が含まれているので結果がnilになること")
    ```

  * テスト失敗時のエラーメッセージをわかりやすくしておくことで、実際にテストが失敗したときに、その原因の調査や修正にかかるコストを下げることに繋がる

### テストデータを選ぶ

* 同値分割
  * テスト対象が同じ振る舞いをすると想定されるデータを、ひとつのグループとして みなして分割する考え方。各グループでは、どの値を選んでも同じ振る舞いになることが想定されるので、そのグループ内 から代表値をひとつだけ選べばよいという考え方ができます。
* 境界値
* 単項目チェック
  * 一つの条件に対してテストを行う。組合せ爆発といった場合に有効

### テストの構造化

テストの構造化をすることで複雑なテストを整理・共通化でき、テストのメンテナンスがしやすくなる。任意の条件を持つテストをまとめる。
XCTestだと`runActivity(named:block:)`でまとめることができる。

### ランダム

テストの実行順序をランダム化することで、複数のテストメソッド同士に実行順序の依存関係が生まれることを防げる。
複数のテストメソッド同士に依存関係が発生すると、テストが壊れたときに別のテストも壊れてしまったり、問題の切り分けがしづらくなってしまったりする。

### 何をテストすべきか

  * API通信のテスト
    * APIの開発を待たなくてよい
    * 様々なレスポンスケースで確認
  * 手動で発生させることが難しいケースのテスト
    * 時間がかかるもの
      * 日数の経過がトリガー
      * 1分間に1億タップすることがトリガー

### 心持ち

> 「不安」という感情は一時的に見えても、ソフトウェア開発のような知能労働においては、生産性 に大きく影響します。後述するテスト駆動開発では、そういった感情を大切にしますし、エクスト リーム・プログラミング(XP)においては、価値として「勇気」をおいています。
>
> テストケースについて考える際は、機械的なアプローチによって効率的にテストを減らすだけでなく、費用対効果を意識し、時には感情についても考慮することで、品質のよいソフトウェアを継続的にリリースし続けられる強い組織になるでしょう。

### 参考

* 松尾 和昭，細沼 祐介，田中 賢治，平田 敏之，玉城 信悟，横田 孝次郎，加藤 寛人　（2019）．　iOSテスト全書　PEAKS出版

## ドキュメント作成

どうすれば良いドキュメントができるか

> トップダウンでドキュメントが必須だと明確にチームに伝える
開発する上で書く必要のあるドキュメントの種類を明確にする
SSOT(Single Source Of Truth)を意識してドキュメントを更新し続ける
チャットの履歴を一定期間しか残さない

* [プロダクト開発でドキュメントを書かないとどうなるか](https://product-develop.com/2c981f18e9924410bb266a5fd87343c2)

## 認証と認可

<img width="800" alt="認証と認可 2021-08-17 4 35 21" src="https://user-images.githubusercontent.com/20992687/129619742-6c502b08-ecae-4d22-b164-4f65138ec3c5.png">

[よくわかる認証と認可 | DevelopersIO](https://dev.classmethod.jp/articles/authentication-and-authorization/#return-note-184783-1)

## 不具合報告と対応

* **本当に不具合であるかの確認**
  * 不具合の報告はサービス責任者からすると不具合でないケースも存在します。
    従ってまずは不具合であるかどうかを、サービス責任者が確定することが必要です。
  * 不具合であるかどうかは下記要素で確定します。
    * 仕様と矛盾がある
    * 明らかに不自然な挙動（仕様に明記されていないが、同等のサービスと比較して明らかに不自然である。たとえば、アプリケーション起動状態が数分続くとアプリケーションが終了するなど）
  * **不具合でない場合**
    * 参照資料をもとに現在の事象を説明
  * **不具合である場合**
    * 期待する結果と現在の結果を明記
    * **再現できる場合**
      * 再現環境、手順の明確化
      * 不具合への対処
        * 仮説、検証を繰り返す
    * **再現しない場合**
      * 仮説、検証により再現する方法を確認
      * 製品版にログを挿入し、詳細な情報を取得できるようにしそれをもって再度調査する

**デバッグ時の記述方針**

* 事実を記載
* 推測は断定しない内容で記載

## 見積もり

* サーバー側の工数を見積もる上では、画面という切り口で見積もるより、業務ドメインという単位で見積もるのが画面ベースより良さそう

## 命名

* 真偽値の命名

  * is始まりを検討する

  * それ以外の「動詞」、「助動詞」を検討
    exists (存在するか)
    contains (含まれているか)
    has (持っているか)
    needs (必要か)

    can (できるか)（is ~able でもok）
    should (すべきか)
    need (する必要があるか)
    
## Github

* `git reset --hard origin/{develop}`

リモートの任意のブランチと同じ状態（HEADの位置・インデックス・ワーキングツリーを一致させた状態）にする
