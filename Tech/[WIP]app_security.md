**Workbook** for "Security data management for app devs" workshop during [try! Swift world](https://www.tryswift.co/world/#). By Anastasiia [@vixentael](https://twitter.com/vixentael).

# Table of contents
1. [Defining data model, risks, threats, security controls](#datamodel)
    1. [Example](#datamodel-example)
    2. [Exercises](#datamodel-exercises)
2. [Software security controls](#controls)
3. [Security tools](#tools)
4. [Regulations](#regulations)
5. [Security design guidelines](#design-guidelines)
6. [Risk management guides](#risk-mngm-guides)
7. [Security verification and testing](#testing)
8. [Resources](#resources)

---



<a name="datamodel"></a>

## Defining data model, risks, threats, security controls.

<a name="datamodel-example"></a>

#### **Example** 

ノートを取るアプリまたはTodoアプリを想像してみてください。ユーザーは秘密のメモをそこに置き、メモがアプリ開発者とAppleから保護されているとします。開発者は下記のデータモデルに準じてメモの暗号化を実装しました。アプリはiCloudバックエンドを使用し、iCloudKitを経由するため、ユーザーのログイン/承認を処理しません。

##### Example 1.1. Data model of Note-taking app.

| **Code** | **Data type**       | **Description**                                              |
| :------- | :------------------ | :----------------------------------------------------------- |
| **NT**   | plaintext note      | ユーザーによって生成され、iCloudを介してユーザーのデバイス間で同期されます。ユーザーは多数のNTを作成できます。 |
| **PW**   | user password       | NEkの生成に必要なパスワードです。ユーザー入力またはiOSキーチェーンによって生成されます。アプリごとに1つのPW。 |
| **NEk**  | note encryption key | PWからアプリによって生成され、「ロックして暗号化」/「ロックを解除して復号化」するのに使用されます。 NTごとに1 NEk。 |

リスクが異なれば、組織/ユーザーへの影響も異なります。リスクが高いほど、損害が大きくなります。

##### Example 1.2. Risks to data of Note-taking app. 

Levels: （高）critical, high, moderate, low（低）

| Risks   | Access（アクセス）                                           | Disclosure（開示）                                           | Modification（編集）                                         | Access denial（アクセス拒否）                                |
| :------ | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| **NT**  | Moderate<br />ノートは必然的にある時点でデバイス画面に表示される | Critical<br />これはまさにユーザーが保護してほしいもの       | Critical                                                     | High<br />テキストの内容が失われるとユーザーは怒ります       |
| **PW**  | Moderate<br />パスワードだけでメモを解読することはできません | Critical <br />ユーザーはパスワードを再利用する傾向があるため、プレーンテキストでの使用は避けるべき | Critical <br />このパスワードにリンクされたメモを解読できない | Critical<br />パスワードを失うことは暗号化されたすべてのメモを失うことを意味します |
| **NEk** | Moderate<br />1つのノートの暗号化に使用される                | Low<br />1つのノートの暗号化に使用される                     | Low<br />間違ったキーで特定のノートの復号化は不可能          | Low<br />鍵の紛失—特定のメモの復号化は不可能                 |

リスクは、攻撃者がどのようにそれらを悪用する方法を見つけるまで机上の空論に過ぎません。
攻撃方針はそのような方法です。

##### Example 1.3. High priority attack vectors.

優先度の高い攻撃方針（攻撃者がリスクを実装する方法）
- アプリとバックエンド間のデータ転送（トランスポート暗号化の破損またはNT暗号化の破損）。
-  サードパーティライブラリの脆弱性（例：サードパーティとNTを共有することにつながるアナリティクスSDKの脆弱性）。 
- 未確認のiCloudの脆弱性。 
- NTまたはPWの盗用につながるiOSの脱獄攻撃（リモートJBを含む）。 
- iCloudキーチェーンの脆弱性（PWの盗用につながる）



##### Example 1.4. Security controls against high risks and high priority attack vectors.

脅威とリスクが明らかになり、PWは重要なリソースであることがわかりました。パスワードはiOS固有の脆弱性のために盗まれる可能性があるため、アプリはPWをプレーンテキストで使用すべきではありません。

| **Data class** | **Security control  (transfer)**                             | **Security control  (storage)**                              |
| -------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **NT**         | TLS.<br/>メモの暗号化<br/>iCloud証明書のピン留め             | 暗号化されて保存される<br />NEkはノートごとに一意であり、永続ストレージ（メモリで計算）に保存されない<br /> 自動ロックタイマー（非アクティブ状態が1分間続くとNTが暗号化される）<br />NTはプレーンテキストで永続的に表示されることはなく、画面上でメモリ変数に格納されるのみ |
| **PW**         | アプリによって転送されない<br />iCloudKeychainによって転送される可能性あり | パスワードベースのKDF（鍵導出関数）とアプリで生成されたソルトを使用してハッシュとして保存される<br /> Keychain / iCloudKeychainにハッシュとして保存される<br /> キーチェーンには追加の生体認証保護機能がある（ユーザーが有効にしている場合） |
| **NEk**        | 転送されない                                                 | 永続的に保存されず、使用前に計算される<br />使用後、メモリ変数はゼロで埋められる<br />自動ロックタイマーによってメモリから削除される。 |

（東原めも）

* 証明書のピン留めの話は下記が参考になる
  * [iOSアプリ内で不正なSSL証明書を検知する / SSL Pinning for iOS apps](https://speakerdeck.com/kobakei/ssl-pinning-for-ios-apps)
* ソルトについて
  * [暗号理論におけるソルト化とは？セキュリティを強化する方法を解説！](https://it-trend.jp/encryption/article/64-0068)

##### Example 1.5. Read more.

メモを取るアプリのリスク管理の実際の公開例は、Bear app です。 [このブログ記事](https://www.cossacklabs.com/blog/end-to-end-encryption-in-bear-app.html)では、Bearアプリのエンドツーエンド暗号化の構築について説明しました。 



---

<a name="datamodel-exercises"></a>

#### Exercises.

ユーザーが機密文書を表示し、それらを互いに共有できるアプリ（ "SecureDropbox"とも呼ばれます）を想像してください。アプリには独自のバックエンドがあります。アプリのデータに関する情報に基づいて、リスクモデル、攻撃ベクトル、およびセキュリティ管理を示唆しています。



##### Exercise 1.1. Review data model of Document app.

| **Code** | **Data type**                   | **Description**                                              |
| :------- | ------------------------------- | ------------------------------------------------------------ |
| **D-US** | User session info               | ユーザーがログインしているときにアプリのキーチェーンにあるJWTトークン、メール、パスワード。GDPR、CCPAなどでは、メールはPII (Personally Identifiable Information) と見なされる場合があります。 |
| **D-AK** | API keys of 3rd party libraries | アプリが使用するライブラリのAPIトークン。 plistに保存されているApp Bundleの一部。 |
| **D-IC** | Integrity checksums             | アプリバンドルの一部として保存されている一部のコンポーネント（サードパーティライブラリのindex.htmlファイル）のハッシュ。サードパーティのライブラリが変更されていないことを確認するために使用される。 |
| **D-BI** | User business info              | 名前、役職、会社、電話番号。永続的に保存されず、API呼び出しを使用して受信され、アプリの実行中にメモリにキャッシュされます。 GDPR、CCPA (カリフォルニア州消費者プライバシー法) によって規制されている。 |
| **D-DC** | Documents                       | ユーザーは特定のプロジェクトのドキュメント（pdf、docx、xlsファイル）にアクセスできます。ユーザーはアプリからドキュメントを生成するのではなく、読むだけです。 GDPR、CCPAによって規制されている。 |



##### Exercise 1.2. Fill in empty spaces in risks to data of Document app.

| Risks    | Access                               | Disclosure                           | Modification                               | Access denial                            |
| :------- | :----------------------------------- | :----------------------------------- | :----------------------------------------- | :--------------------------------------- |
| **D-US** | High / Critical                      | High / Critical                      | Moderate / Critical                        | Low                                      |
| **D-AK** | Low (for analytics lib) / High (AWS) | Low (for analytics lib) / High (AWS) | Low / High if API keys are unique per user | same                                     |
| **D-IC** | Low                                  | Low                                  | Critical                                   | High                                     |
| **D-BI** | Moderate / High                      | Critial / High                       | Moderate / High                            | Low — for iOS app<br />Moderate / High   |
| **D-DC** | High                                 | Critical                             | Critical                                   | Low — for iOS app<br/>depends on backups |



##### Exercise 1.3. Define high-priority attack vectors for Documents app.

High-priority attack vectors: 

- アプリとアプリケーションバックエンド間のデータ転送（壊れたトランスポート暗号化）、MITM。
- ユーザーロールの権限昇格（ユーザーが持つべきではないドキュメント/プロジェクトへのアクセス）。 
- DOS
- キャッシュから情報を読み取る
- JBデバイス
- アクセシブルなドキュメント（悪いロール管理）
- 3番目のライブラリの交換



##### Exercise 1.4. Define security controls against high risks and high priority attack vectors for Documents app.

リスクと攻撃ベクトルについて学んだことに基づいて、保護対策を提案します

| **Data class** | **Security control  (transfer)**                             | **Security control  (storage)**                              |
| -------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **D-US**       | ユーザー認証の成功<br />クライアント証明書のピン留め<br />サードパーティのキーボードを無効にする<br />スロットリング<br/>エラーコード/その理由を明らかにしない | 保管しない<br />暗号化して保存<br />キーチェーンに保存<br />バイオメトリクス保護機能付きのキーチェーンに保存<br />離脱でフラッシュ<br />タイマーでフラッシュ |
| **D-AK**       | TLS<br/>証明書のピン留め<br/>一時的な API キー               | 静的なアプリ内キーで暗号化されて保存され、実行中のアプリで復号化されます。<br />難読化<br />ハニーポット<br />保存せず、API呼び出しから取得 |
| **D-IC**       | 転送しない                                                   | APIキーと同じ                                                |
| **D-BI**       | **D-US**と同じ                                               | 永続的に保存しない <br />繰り返し認証                        |
| **D-DC**       | TLS.<br/>ユーザー認証のせい恋<br />クライアント証明書のピン留め。 <br />DRMのような対応 | 永続的に保存されません。<br /> ユーザーがドキュメントを閉じたときにキャッシュから削除されました。<br /> 自動ロックタイマー。<br /> 電子透かし |



（東原メモ）

* スロットリング

  * >スロットリング: リクエストを送信できる頻度を制限する
    >AmazonマーケットプレイスWebサービス(Amazon MWS)を正常に使用するには、スロットルを理解する必要があります。スロットルとは、一定時間内に送信できるリクエスト数を制限するプロセスのことです。リクエストとは、在庫フィードを送信したとき、または注文レポートをリクエストしたときなどです。スロットルは、リクエストがWebサービスに殺到するのを防ぎ、認証されたすべての開発者が確実にWebサービスにアクセスできるようにするものです。

    引用: [Amazonマーケットプレイス Web サービス (Amazon MWS) ドキュメント](https://developer.amazonservices.jp/gp/mws/docs.html)

* ハニーポット

  * > 不正なアクセスを受けることを前提としたシステムやネットワークのことです。
    >
    > ハニーポット（Honeypot）は日本語で言えば「蜜がつまった壺」の意味を持ちます。システムやネットワークへの攻撃者は、ハニーポットを攻撃しやすく重要な情報がありそうなコンピュータだと思いこんで攻撃を仕掛けます。まさにハニーポットは攻撃者にとって「甘い罠」

    引用: [ハニーポットとは？仕組みやメリット、課題について徹底解説](https://cybersecurity-jp.com/security-measures/29299)

SIEM

<a name="controls"></a>

## Software security controls for mobile apps

モバイルアプリのセキュリティを向上させるために使用できるセキュリティコントロールは数多くあります。それらのアプリのソフトウェアベースであったり、アプリのバックエンドで有効であったり、組織ベースのものや（セキュリティ意識向上トレーニング、パスワードリセットポリシーなど）。 ）、サードパーティのサービスプロバイダーに依存しているものもあります（セキュリティエンジニアリング、セキュリティ設計、ペンテスト、セキュリティコード監査など）。 セキュリティ制御の完全なリストは誰も知りません（ただし、NIST SP 800-53には優れたアイデアがあります）。これはモバイル開発者向けに整理したリストです（網羅している訳ではないですが）。また、OWASP MASVSチェックリストは良い示唆となります。

**Transport/network:**

* 適切なTLS設定 
* 証明書のピン留め（クライアント証明書のピン留め）
* 追加の暗号化レイヤー、アプリケーションレベルのペイロード暗号化（同じユーザーのデータのエンドツーエンドの暗号化、userAからuserBへのデータの暗号化など）
* アプリが重要な操作のために単一の安全でない通信チャネルに依存しない

**Storage:**

* データ暗号化 
* キーの暗号化
* キー管理
* アプリコンテナー/システムシークレットストレージの外部にデータを保存しない
* Keychain / SecureEnclaveへの保存
* キーチェーンにバイオメトリクス保護で保存
* 不要になったときにデータを消去する
* 「ゼロ化」によるデータの「安全なワイプアウト」（ヌル化する前に変数をゼロで埋めます）
* 重要なユーザーデータのバックアップ（バックアップを推奨）

ゼロ化ってどれくらい有効なの？てかなにがしたいの、ステップおおくすることでなくすことを慎重にしたいてこと？

**Access control:**

* デバイスのピン保護（東原めも：ハードウェア自体のピン/パスワード入力のことだと思う）
* 生体認証
* ユーザーセッション認証（OAuth2、JWT、Cookieなど）
* ユーザーセッションの有効/終了期限
* 重要な操作（プロジェクトの削除、パスワードの変更）を実行する前にユーザーを認証する
* ロール管理（ABAC / RBAC）

**Anti-reverse engineering and JB-protection:**

* 特に重要なアクションの実行時にデバイスがジェイルブレイクされているかどうかをチェックし、ユーザーに警告する
* シミュレーターで実行されているかどうかを検出する
* デバッグツールを使用して実行されたときに検出する
* 試行回数を制限する、anti-bruteforce timers/counters （総当たり攻撃の防止）
* コード難読化
* ロードされたライブラリの整合性チェック（ライブラリがパッケージマネージャーによって追加されたとき、アプリが実行時にライブラリを呼び出したとき）　これなに？

**Platform**

* アプリは有効な認証情報で署名されており、誰もアカウントのプロビジョニングプロファイルと秘密鍵にアクセスできない
* リリースアプリでデバッグシンボルが削除されている
* アプリは最新の接続先と最新のセキュリティライブラリにのみ依存する
* アプリは、カスタムURLスキームを介して機密機能をエクスポートしない

**Monitoring:**

* サードパーティの依存関係のセキュリティテスト/監視
* ハニーポット（偽のユーザー認証情報、APIリクエスト、コードの一部）
* 「危険な」ユーザー行動の追跡（失敗したログイン試行、JBデバイスでアプリを開く、復号化エラー）
* セキュリティイベント監視システム（SIEM）



（東原メモ）

* デバッグシンボル

  * > プログラムやライブラリの多くは、デフォルトではデバッグシンボルを含めてコンパイルされています。 (**gcc** の *`-g`* オプションが用いられています。) デバッグ情報を含めてコンパイルされたプログラムやライブラリは、デバッグ時にメモリアドレスが参照できるだけでなく、処理ルーチンや変数の名称も知ることができます。

    引用: [Linux From Scratch - Version 6.6 第6章 基本的なソフトウェアのインストール](http://archive.linux.or.jp/JF/JFdocs/LFS-BOOK/chapter06/aboutdebug.html)



<a name="tools"></a>

## List of (defensive) appsec tools for mobile apps

モバイルアプリに役立つセキュリティツールの完全なリストなんてどこにもないけど、[tools.tldr.run](https://tools.tldr.run/) みたいなサイトは参考になります。

**Multi-platform high-level encryption libraries:**

* [Themis](https://github.com/cossacklabs/themis)
* [SwiftSodium](https://github.com/jedisct1/swift-sodium)
* [RNCryptor](https://github.com/RNCryptor/RNCryptor)

**Apple-first encryption libraries:**

* CryptoKit (high level)
* CommonCrypto (low level)

**Secrets management:**

- [awslasb/git-secrets](awslasb/git-secrets) — prevents from committing secrets
- [cocoapods-keys](https://github.com/orta/cocoapods-keys) by @orta — keep secrets away from github
- [gitleaks](https://github.com/zricethezav/gitleaks) — scans repo for missing secrets
- [ios-datasec-basics](https://github.com/vixentael/ios-datasec-basics) — repo that describes methods how to encrypt API keys before storing in the app

**Dependency checks (SCA, software composition analysis):**

* [WhiteSourceSoftware](https://www.whitesourcesoftware.com/) plugin for iOS, known to check Carthage
* [BlackDuckSoftware](https://www.blackducksoftware.com/) pluging for iOS, known to check CocoaPods
* [Snyk](https://snyk.io/test/) checks for React Native and Cordova
* npm audit, github notification, python, [OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/) — for backend code

**Obfuscation, code hardening, threat protection :**

* [dexprotector](https://dexprotector.com/), [tutorial for iOS](https://dev.to/shostarsson/application-obfuscation-on-ios-3d2c)
* [GuardSquare](https://www.guardsquare.com/en)
* [Swift Shield](https://github.com/rockbruno/swiftshield)
* [blogpost with other tools](https://www.polidea.com/blog/open-source-code-obfuscation-tool-for-protecting-ios-apps/)

**Anti-JB protection (see above, plus):**

* [disable debug](https://gist.github.com/mattlawer/d391c5137f987d109c54b58a7ce36a04)
* [detect debugging](https://gist.github.com/julepka/de2c9094118d47112e22dc7761579e3b)
* [jailbreak detection blogpost](https://duo.com/blog/jailbreak-detector-detector)

**SAST/DAST**

* [checkmarx](https://www.checkmarx.com/)
* [sonarqube](https://www.sonarqube.org/)
* [veracode](https://www.veracode.com/products/binary-static-analysis-sast)
* [appknox](https://www.appknox.com/dynamic-application-security-testing)
* [app-ray](https://app-ray.co/)
* [blogpost with other tools](https://www.softwaretestinghelp.com/mobile-app-security-testing-tools/)

Beware: automated tools typically require ongoing attention due to large number of false positives / false negatives.


<a name="regulations"></a>

## Data protection regulations

規制は国/地域、業界、ビジネス活動によって異なります。
例えば以下のようなものがあります。

**General data security compliance:** ISO/IEC 27002:2013, CCPA, NIST 800-171, FIPS 140-2, GDPR, DPA, Brazilian General Data Protection Act, etc

**Finance**: PCI DSS, PCI HSM, SWIFT Customer Security Controls, PSD2, FINMA, GLBA, etc

**Healthcare**: HIPAA, HITECH, ISO 27799:2016, etc

**Education**: FERPA, etc

[Apple Export regulations on cryptography](https://docs.cossacklabs.com/pages/apple-export-regulations/)



[**Cheatsheet** on major regulations](https://www.cossacklabs.com/blog/what-we-need-to-encrypt-cheatsheet.html), what data they require to protect.



<a name="design-guidelines"></a>

## Mobile application security design (standards and guidelines)

[Apple platform security guides](https://support.apple.com/guide/security/welcome/web) —  157pのpdf資料です。アップルのハードウェアセキュリティ、システムセキュリティ、暗号化とデータ保護、アプリセキュリティ、ネットワークセキュリティ、開発キットについて説明しています。 アプリの実行環境、プラットフォームの制限、セキュリティコントロールを理解するのに役立ちます。

[iOS security guidelines](https://github.com/0xmachos/iOS-Security-Guides) — iOS 12.3まで更新されているiOS固有のガイドラインです。Appleのセキュリティガイドに統合されました（上記を参照）。

[Privacy chapter from App Store review guidelines](https://developer.apple.com/app-store/review/guidelines/#privacy) — プライバシーポリシー、データ収集、保存、使用、共有に関するApp Storeのガイドラインについて説明されています。

[NIST SP 800-53, Security and Privacy Controls for Federal Information Systems and Organizations](https://csrc.nist.gov/publications/detail/sp/800-53/rev-4/final) — describes numerous technology-independent security controls, classifies them by "family", usage, functionality, capabilities, etc. 



<a name="risk-mngm-guides"></a>

## Risk management guides

*Mobile world doesn't have separate risk management guidelines, just another types of risks. Check software risk management frameworks and apply to mobile dev according to mobile app risks.* 

[OWASP mobile risks top10](https://owasp.org/www-project-mobile-top-10/) — short list of most popular risks for mobile apps made by OWASP, dated 2016. Useful for quick understanding of typical risks and their mitigations.

[FAIR risk assessment](https://www.fairinstitute.org/) — rather short (comparing to others) framework on risk calculation and triage.

[NIST SP 800-37 "Risk Management Framework for Information Systems and Organizations: A System Life Cycle Approach for Security and Privacy"](https://csrc.nist.gov/publications/detail/sp/800-37/rev-2/final) — describes risk management of application development inside organization, provides clear guidance for large organizations. Use it if you work in large organization and need to establish risk management process across deparments, or read to feel how simple mobile app development is in comparison.



<a name="testing"></a>

## Mobile application security verification and testing

[OWASP Mobile application security verification standard (MASVS)](https://github.com/OWASP/owasp-masvs) — checklist of mobile app security requirements, different depending on app/data risks, business requirements and regulations. Use it to measure "security scores" for your app — how good it is — and to track progress by repeating MASVS checks every 6-12 months.

[OWASP Mobile security testing guide (MSTG)](https://github.com/OWASP/owasp-mstg) — describes *how* to perform security verifications from MASVS, gives ideas and pieces of code. Use it as "tutorial" to MASVS.

[NIST SP 800-163, Vetting the Security of Mobile Applications](https://csrc.nist.gov/publications/detail/sp/800-163/rev-1/final) — mobile app vetting is a process to ensure that mobile app conforms to an organization’s security requirements and is "reasonably free" from vulnerabilities. Describes vetting process (including budgeting and staff) and typical iOS/Android app vulnerabilities.

[OWASP Software assurance maturity model (SAMM)](https://owaspsamm.org/) — "checklist" for the whole organization that produces software, covers not only software properties, but organization dev process (understanding threats, selecting security providers, taking care about software security architecture). Use it to measure how good software security is in your organization.

<a name="resources"></a>

## More links

**iOS-specific security things, tips how to start with your app security**

- ["Popular note-taking apps share these security flaws: security tips for developers"](https://medium.com/@vixentael/popular-note-taking-apps-share-these-security-flaws-security-tips-for-developers-326180e41329) 
- [X Things you Need to Know before Implementing Cryptography](https://speakerdeck.com/vixentael/x-things-you-need-to-know-before-implementing-cryptography) by [@vixentael](https://twitter.com/vixentael)
- [By-passing biometrics protection](https://speakerdeck.com/julep/making-authentication-more-secure) slides by [@julepka](https://twitter.com/julepka)
- [End-to-end encryption for Wire](http://www.swifttube.co/video/end-to-end-encryption-for-ios-developer-mihail-gerasimenko) by @GerasimenkoMiha
- [Building end-to-end encryption for Bear app](https://speakerdeck.com/vixentael/10-lines-of-encryption-1500-lines-of-key-management) by @vixentael

**Books**

* [NoStarch iOS security book](https://nostarch.com/iossecurity)
* [Password authentication for web and mobile apps](https://dchest.com/authbook/) book by Dmitry Chestnykh
* [API security](https://developer.okta.com/books/api-security/)

**Online courses / workshops**

- [online course on reverse engineering iOS apps](https://github.com/ivRodriguezCA/RE-iOS-Apps) by [@ivRodriguezCA](https://twitter.com/ivRodriguezCA)
- [other talks and workshops on iOS app security](https://github.com/vixentael/my-talks) by [@vixentael](https://twitter.com/vixentael)



## Stay tuned

We do data security for living. At Cossack Labs we help companies who process sensitive data and want to protect it against external attackers, insiders, mis-configurations and to be compliant with regulations. We build and license our own proprietary or open source software, or build custom solutions tailored for specific use cases.

Ping [@vixentael](https://twitter.com/vixentael) or [@cossacklabs](https://cossacklabs.com/), if you need security engineering assistance :)