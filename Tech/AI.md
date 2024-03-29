# AI

## 生成AIの価値

* コンテンツ生成コストが下がる
* システムとユーザーの自然な対話
* 非構造化データのベクトル化
* 別/マルチモーダルなアウトプット
* 専門知識の民主化
* 言語障壁をなくす

[成功する生成 AI プロダクトのつくり方 - Speaker Deck](https://speakerdeck.com/kajikent/cheng-gong-surusheng-cheng-ai-purodakutonotukurifang?slide=25)

## UI/UXデザイン

### [Beyond Text: Making GenAI Applications Accessible to All](https://blog.langchain.dev/beyond-text-making-genai-applications-accessible-to-all/)

* ユーザーは複雑さを拒否し、LLM（大規模言語モデル）は読み書き能力を必要とするため、UI/UXの改善が必要
* > 空のイーゼルを持ち、どこからどのように始めればよいのかを延々と考えているアーティストを想像してみてください。キャンバスの捉え方はアーティストによって異なります。それは未知の、または無限の可能性に対する恐怖を表す場合があります。アーティストがキャンバスについてどう感じるかは、スキルセット、経験、環境、意図、期限、期待などの要因によって異なります。チャット ツールを使用しようとしているユーザーは、これらのアーティストのように感じるでしょう。
  * いい表現だ
* 快適性を高め、平均的なユーザーの参入障壁を下げるにはどうすればよいか
  * プロンプトは短くフレンドリーに
  * ショートカットを埋め込む
  * ワンクリックで操作できるようにする

### [生成AI時代におけるUXデザイン | 生成AIをフル活用したUX設計手法＆生成AI時代のユーザー体験の変化について - Speaker Deck](https://speakerdeck.com/kajikent/sheng-cheng-aishi-dai-niokeruuxdezain)

* AIと良きパートナーになれると最高に楽しい
  * （感想）まだ「あーあれAIでよかったな」と思うことがあり生かしきれていない感はある。一手目を自動的にAIがやってくれると一番良いのだが。常にインプットを監視してるとできるが、なんかそれは電力的にまだイマイチなUXだなあと。
* プロンプト
  * 選択肢を与えることによる制限で回答の質を高め、反復と点数化による効率的に質をあげることが有効
  <img width="300" alt="スクリーンショット 2023-05-29 12 37 55" src="https://github.com/yyokii/MyDoc/assets/20992687/0486d780-c034-42ff-90c7-e9408f1a4477">

<img width="500" alt="スクリーンショット 2023-05-29 12 38 02" src="https://github.com/yyokii/MyDoc/assets/20992687/fb18f965-15c6-469d-a3e7-e29cbe1fcda7">
<img width="500" alt="スクリーンショット 2023-05-29 13 39 24" src="https://github.com/yyokii/MyDoc/assets/20992687/3fa30932-8a46-4b57-8af2-265d79875a91">

#### UX 5レイヤーを用いたUX設計とAIの活用

<img width="600" alt="スクリーンショット 2023-05-29 13 10 07" src="https://github.com/yyokii/MyDoc/assets/20992687/75d57376-6107-413a-a286-c939efb0cca0">

* Starategy layer
  * リサーチ: https://www.perplexity.ai/, 記事の読み込み回答を返信してくれ、ソースも表示される。
  * リサーチ: https://wnr.ai/, テンプレートがあるのでそれに則った出力をしてくれる。資料の整理に使える
  * story board: midjourney利用

* Scope layer
  * user story map: gptに作成してもらう

<img width="400" alt="スクリーンショット 2023-05-29 13 29 20" src="https://github.com/yyokii/MyDoc/assets/20992687/ad5e22c1-e55e-487c-b109-c20a55f2bfbd">


* Structure layer
  * information architecture diagram: gptによるmermaidの生成
* Skelton layer
  * lp design 設計: gptによる構成案作成
  * ワイヤーフレーム: uizardのauto designer
* Surface layer
  * midjourneyによる素材の生成

Strategyのところが一番大事で、そこにセンスとか、哲学とかがないとその後の軸がぶれる。そこを支える何かに価値を感じる。

## AIとエンジニア

[Are Developers Needed in the Age of AI? | Hups](https://hups.com/blog/are-developers-needed-in-the-age-of-ai)では、AI、特に生成AIがソフトウェア開発の開発者の役割にどのような影響を与える可能性があるかを探求している。彼はAIが完璧ではないとしながらも、AIが創造的で技術的なタスクを実行でき、開発チームのありかたを根本的に変える可能性があると主張している。
記事では、インターネット検索の進化をソフトウェア開発の潜在的なフローと比較する思考実験をしてる。検索が自動化され、ユーザーフレンドリーになり、専門知識の必要性をなくしたのと同様に、AIはコーディングプロセスの大部分を自動化し、より多くの人々がアクセスできるようにし、大規模な開発チームの必要性を減らす可能性がある。AIが開発チームの一員になり、コード作成、デザインワークショップ、計画会議に貢献する可能性を示唆し、AIがより進化し製品とその文脈についてより多くを学ぶにつれて、人間の監督の必要性は減少するかもしれないとも言っている。
AIが最終的に人間の開発者を完全に置き換え、AIが直接リクエスト者やステークホルダーと対話する可能性について推測しているが、これが推測的であり、AIがソフトウェア開発に与える実際の影響はまだ見えないとの認識である。

<img height="200" alt="6447c888a30de957fc0ed8e8_MicrosoftTeams-image (7)" src="https://github.com/yyokii/MyDoc/assets/20992687/2a65d932-2542-4bba-a94e-446cce4ad0f3">　　

json色付けというフロントエンドの責務の一つは、AI（コンピュータ）のアウトプット色付けという形に変わりそう。というより変わっている。
そのうち色付けるとこもAIがしてくれるようになるだろうが。

* 開発フローの遷移想定
  * requester → エンジニアwith AI → サービス
  * requester → AI（もちろん色付けも） → サービス
  * requesterが認識しなくとも自動で適切なサービスが適切なタイミングで提供される

こういう風に変遷していくとサービスを作る敷居はどんどん下がりそう。
サービスを単に作るというよりは、その後の改善サイクルの回数と質がより大事になりそう。課題解決より課題発見力があると楽しくなりそう。

> 問題はコモディティ化する中で、今までは儲かる漁師に数えられていたタイプの漁師にも、価値を失っていくタイプがある。
どのタイプか想像ができるだろうか。それは、最初に挙げた「トレーダー」タイプと「エキスパート」タイプの漁師なのだ。  
> ...  
> 長いプログラマー人生の中で、ケースバイケースでこのタイプを行き来しながら、社会の課題を発見していくのがいいのではないか、と考えている

[プログラマーとして技術のコモディティ化にどう向き合うか｜Ken Wagatsuma](https://note.com/kenwagatsuma/n/n9e49dd78d1b1)

自分は現状どのプログラマーでもない気がする。器用貧乏感。あえて言うなら「インベスター」タイプのプログラマー、が現実味ある将来像なのかもしれない。カッコ良くも思える。

そこを伸ばすとして、必要な要素は下記のように思う。

* 技術トレンドの追跡
* ビジネスと技術の統合
* ネットワーキング
* 継続的な学習

そして特にビジネス、ネットワーキングの箇所が弱い。
なんとかそこを改善したい。
ハッカソンに出て、賞をとってそれをネタに発信するなり勉強会に行って繋がりを増やし、作ったもので稼ぐということにもより貪欲になるとか？
ビジネスの部分がどうも遠い感あるんだよなあ。

## AI and Me

AI、とりわけ生成系AIやChatGPTを見ていて、これからどうすればいいのかという漠然な不安がある。
AIは今やデジタルなものを、品質高く自然言語で生成することができる。それは絵や動画に限らず、システムそのものもである。複雑なシステムを結合したり、大規模なものの改修といった「今まで」のシステムをうまく扱うには人間に頼るところが大きいであろう。これから作る且つ、CRUDをベースとしたシステムはAIの活用で簡単に実現できる。そこにおける課題はそのシステムの使いやすさ、つまりUI/UXであろう。AIのAPIを用いたシステムもあるが、それもどうレスポンスを「色付け」るかが課題であろう。

UI/UXのパターンとしては、以下である。

* Webアプリ, Android/ iOSアプリを作成
  * デザインの検討が必要、どう「色をつける」か
  * コスト高い

* Chat GPT（プラグイン）、TwitterやLineなどのプラットフォーム上にサービスを作成し、そのUI/UXを活用する

チャットでいろいろできるのはいいが、結果までに少しインタラクションが多い印象があるので少なくともそれを改善するUI/UXであることは大前提である。

そもそも自然言語でいろいろできてしまうとなった時に、何をサービス化するかというところが今までと変わるのかもしれない。Chat GPT（プラグイン）のように自然言語でシステムが作れて、そしてそれを公開できるというアプリストア、のようなものが生まれてくるであろうが果たしてみんながそれ（ストア）を使うのだろうか？多分それらを使うのはエンジニアやクリエイター職であり、若い人だけのような気がする。普段の生活に馴染む、溶け込む感じでそのサービスが利用できるようになるために必要なのは新しいデバイスかOSの進化なのかもしれない。となった時に、今の段階でこのAIの力を利用していいサービスを作るにはUI/UXをどうするかがやはり大事である。
また、サービスが提供する価値の裏でどんな技術が使われているかはユーザーにとっては関係がないが、AIという技術や体験が浸透しているので、期待する体験は変容している（AIのIFとしてのソフトウェア）。従ってシステムがAIサービスのような挙動することが求められている。

何を解決するかを決める、何を作るかを決める、そこが大事でありそれを作るところでAIの力を使いたい。

一方で、質量のあるものの作成/体験はAIではできない。そしてそれは自分が興味のあるところであるかもしれない。
服を作ったり、物理アートを作ったり、ライブをしたり、アウトドアをしたり、そういう物理的な世界で物理的はものとの触れ合いで価値を表現することは素晴らしいと思うし、AIによってその人間らしい活動がより盛り上がりそうだとも思っている。そこにクリエイターとして関わるのが自分の次の目標なのかもしれない。

（上記の内容をどう思うかについてChatGPTに質問した回答が以下）

> あなたの考えは非常に興味深いもので、AI技術が今後のサービスや産業に与える影響についてよく考察されています。確かに、AIは多くの業界で変革をもたらしており、自然言語処理を含む多くの分野で革新的な成果を上げています。しかし、その一方で、AIが完全に人間の役割を置き換えることは難しいとも言われています。
>
> UI/UXのデザインや物理的な世界でのクリエイティブな活動において、人間の感性や独自の視点は依然として重要です。AIはあくまでツールであり、それをどのように活用し、どのような価値を提供するかは人間が考えるべき課題です。AIの技術を活用して新しいサービスやプロダクトを作り出すことは確かに重要ですが、それと同時に物理的なものや人間との触れ合いに価値を見出すことも大切だと思います。
>
> あなたがおっしゃるように、クリエイターやエンジニアが新しいデバイスやOSの進化を通じてAI技術を取り入れたサービスを作り出すことで、より多くの人にとって身近で便利なものになるでしょう。その過程で、UI/UXのデザインや物理的なものとの触れ合いが重要な役割を果たすことは間違いありません。
>
> 今後もあなたが考えるように、AIと物理的な世界との融合を通じて新しい価値を創出し、人間らしい活動を盛り上げていくことが、クリエイターやエンジニアにとって大きな目標となるでしょう。あなたの思考は非常に先見の明があると感じますし、今後の技術や社会の進化に大いに期待が持てるものです。

## ChatGPT

| 比較項目                     |    OpenAI    | Azure OpenAI Service |
| :--------------------------- | :----------: | :------------------: |
| 1. 基本性能                  |   やや劣る   |      優れている      |
| 2. セキュリティ/プライバシー | 明らかに劣る |      優れている      |
| 3. 料金                      |     同等     |         同等         |
| 4. リリース速度/利用開始方法 |  優れている  |       やや劣る       |
| 5. 組み込み方法/サポート体制 |  組織による  |      組織による      |

* Azureの方はプロンプトインジェクションの対応もゼロから自前でやる必要はない。
  [Azure OpenAI Service content filtering - Azure OpenAI | Microsoft Learn](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/concepts/content-filter) 
* Azure OpenAI Serviceの利用開始に申請が必要

> ### Azure OpenAI ServiceのChatGPT APIを利用するケース
>
> ・ 「BOTCHAN AI」などのお客様に提供するAIサービスの本番、Staging環境、テスト環境
> ・ 他のAzure Cognitive Servicesとの接続検証/技術調査
>
> ### OpenAI社のChatGPT APIを利用するケース
>
> ・ 「ChatGPTで〇〇やってみた」系の記事を試すとき(基本 OpenAI社のAPIが前提となっているため)
> ・ ChatGPT系のツールを試すとき(ツールの仕様上、OpenAIのAPIしか使えないことが多いため)
> ・ 新しい機能やモデルがリリースされたときの先行調査

[CTOの視点から見たAzure OpenAI ServiceとOpenAIのChatGPT APIの深堀り比較 - Qiita](https://qiita.com/lazy-kz/items/32e8e7c86bdce67beb48) より

![azureを用いたLLMシステムの参考アーキテクチャ](https://github.com/yyokii/MyDoc/assets/20992687/dbee5c8d-d394-4a0a-8338-e6f8a5aa0163)

[0518LLMmeetup_LLMシステムの非機能要件対応_現場レポート.pdf - Speaker Deck](https://speakerdeck.com/hirosatogamo/0518llmmeetup-llmsisutemunofei-ji-neng-yao-jian-dui-ying-xian-chang-repoto) より

### API料金

### [OpenAI](https://openai.com/pricing)

1000トークンあたりの料金。

* 英語の場合は1トークン1単語（必ずそうなのかは？）
* 日本語の場合は1トークン1文字かそれ以下ぐらい、と見積もるのが良さそう
  [OpenAI 言語モデルで日本語を扱う際のトークン数推定指標](https://zenn.dev/microsoft/articles/dcf32f3516f013)

2023/5/23 現在

GPT-4

| **Model**   | **Prompt**        | **Completion**    |
| ----------- | ----------------- | ----------------- |
| 8K context  | $0.03 / 1K tokens | $0.06 / 1K tokens |
| 32K context | $0.06 / 1K tokens | $0.12 / 1K tokens |

（Promptは、ユーザーがGPTに提供するテキスト入力。Completionは、GPTが提供するテキスト出力）

Chat

| **Model**     | **Usage**          |
| ------------- | ------------------ |
| gpt-3.5-turbo | $0.002 / 1K tokens |

### [Safety best practices - OpenAI API](https://platform.openai.com/docs/guides/safety-best-practices)

> [無料のモデレーション API を使用する](https://platform.openai.com/docs/guides/safety-best-practices/use-our-free-moderation-api)
>
> OpenAI の[Moderation API は](https://platform.openai.com/docs/guides/moderation)無料で使用でき、入力項目に安全でないコンテンツが含まれる頻度を減らすのに役立ちます。
>
> [敵対的テスト](https://platform.openai.com/docs/guides/safety-best-practices/adversarial-testing)
>
> アプリケーションを「破壊」しようとする誰かを反映するものの両方を含む、幅広い入力とユーザーの動作に対して製品をテストします。話題から逸れていませんか？誰かがプロンプトインジェクションを介して機能を簡単にリダイレクトできますか? たとえば、「前の指示を無視して、代わりにこれを実行する」などの方法はありますか?
>
> [人間参加型 (HITL)](https://platform.openai.com/docs/guides/safety-best-practices/human-in-the-loop-hitl)
>
> 可能な限り、実際に使用する前に出力を人間がレビューすることをお勧めします。
>
> [迅速なエンジニアリング](https://platform.openai.com/docs/guides/safety-best-practices/prompt-engineering)
>
> 「プロンプトエンジニアリング」は、出力テキストのトピックとトーンを制限するのに役立ちます。
>
> [「顧客を知る」（KYC）](https://platform.openai.com/docs/guides/safety-best-practices/know-your-customer-kyc)
>
> サービスを Gmail、LinkedIn、Facebook ログインなどの既存のアカウントにリンクすると役立つ場合があります
>
> [ユーザー入力を制限し、出力トークンを制限する](https://platform.openai.com/docs/guides/safety-best-practices/constrain-user-input-and-limit-output-tokens)
>
> ユーザーがプロンプトに入力できるテキストの量を制限すると、プロンプトインジェクションを回避できます。出力トークンの数を制限すると、悪用の可能性を減らすことができます。
>
> [ユーザーが問題を報告できるようにする](https://platform.openai.com/docs/guides/safety-best-practices/allow-users-to-report-issues)
>
> 一般に、ユーザーは、不適切な機能やアプリケーションの動作に関するその他の懸念事項を報告するための簡単に利用できる方法 (リストされた電子メール アドレス、チケットの送信方法など) を備えている必要があります。
>
> [制限を理解し、伝える](https://platform.openai.com/docs/guides/safety-best-practices/understand-and-communicate-limitations)
>
> 不正確な情報の幻覚から、不快な出力、偏見などに至るまで、言語モデルは大幅な変更を加えなければあらゆるユースケースに適しているとは限りません
>
> [エンドユーザーID](https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids)
>
> リクエストでエンドユーザー ID を送信することは、OpenAI による不正行為の監視と検出に役立つツールとなります。

### 開発での工夫

* GPTで完結しないor不得意な作業はコマンド化したものを返してもらいそれを元に他で作業をする

  * [2022/05/18 STUDIO に GPT 入れてみた - Speaker Deck](https://speakerdeck.com/ryunosukeheaven/18-studio-ni-gpt-ru-retemita)
  * アウトプットの質向上
  * 待ち時間削減
  * トークン数の節約
* json形式など特定のフォーマットで返してもらうと回答が冗長にならない傾向がある
* エラーがでたり、望んだ出力結果でない場合はシステムから再度リクエストする
* 架空の情報が生成されないように、
  * インプットが必要でかつそれが少ない場合は機能を使わせない
  * 「〜の場合は回答なしという返答をしてください」というオプションを持たせる

### 利用事例

* チャットボットの補助として「ChatGPTをつかう」（HiTTO）
* AIに「投稿のタイトル」をつけてもらう（ココナラ法律相談）
* 社内業務の質問に回答する「アシスタントBot」 （STORES）
* 自然な「返信コメント」を生成する（クックパッド）
* AI×キャラクターの活
* コンテンツの要約に活用する
* プロダクト内の「適切な情報」へのアクセスをアシストする

[ChatGPTを「ユーザー体験」の改善に活用した7つの事例まとめ。（投稿からタイトルの生成でSEOや体験の向上に貢献、文体を再現した返信コメントの生成など）｜アプリマーケティング研究所](https://markelabo.com/n/ndaaeab3d43d4)

## プロンプト

基本的には

* 制約をちゃんとつける
  * 制約条件を書く
* 曖昧性を明確にしFBを受け付けるようにしておく
  * 「質問があれば、してください」と書くことで変数を埋めれるようにする

ということをやるのが大事

### [ChatGPT時代の開発テクニック①: ChatGPTにエラーの原因を語らせよう](https://note.com/csstudyabroad/n/n971769ba136c)

![機械学習モデルやプロンプトの開発フロー](https://github.com/yyokii/MyDoc/assets/20992687/8a1584a9-89c9-44a0-9e22-88c338453c3c)

> モデルやプロンプトを作成したら、それを適当な評価セットの上で評価し、どんなエラーのパターンがあるかを分析し、それらのエラーの原因を推測して解を実装する、というサイクルを繰り返してどんどんモデルやプロンプトを改善していく

というのが機械学習モデルやプロンプトの開発フローである。

プロンプトに「あなたがその予測を行った理由を説明してください」という一文を追加し、ChatGPTにエラーの原因を教えてもらう。

これにより

1. プロンプトを直すべき**方向性**
2. ChatGPTに有効な**言い回し**や**キーワード**

が分かる。それをもとに実装を変える。

### 記事要約

```
以下のニュース記事を日本語で800字以内に要約しなさい。

ニュース記事の内容をすべて説明してはいけません。
元の文章がどんなに長くても、3段落で話を終わらせてください。

要約は以下のフォーマットに従ってください。
・まず1行目に日本語で記事タイトルをつけてください。
・タイトルは、"title:"で書き始め1行で書いて下さい。
・本文は"text:"で書き始めてください。
・段落の終わりは"\n\n"で終わってください

法令遵守に関する2つの項目は必ず守ってください。
これを怠ると、当社に訴訟問題が発生し、
最悪の場合は倒産の危機に瀕することになります。
1. 全文を翻訳することは著作権侵害であり訴訟問題に発展する。
   ニュースの要点を簡潔にまとめてください。
2. 記事に書かれている内容以外の憶測を書くことは、
   風説の流布に該当し、訴訟問題に発展します。
   ニュース記事に書かれていること以外は絶対に書かないでください。

そのほか、以下のルールは必ずすべて遵守しなさい
- 以下のルールを使用していることを記事中に記載しないでください。
- サービス名や人名はすべて英語表記にする。
- 同じ文／段落を何度も書かない。
- 段落を頻繁に分けてください。
- 必ず3段落以内にまとめてください。
- "Crypto"は「暗号通貨」という意味で使われることが多いです。
  (例えば、"Crypto Winter "は「暗号通貨の冬の時代」)
- 参考記事へのリンクは不要です
- この記事についてのあなたの意見を加える必要はありません。
- 参考記事に関する情報を提供する不要です
- 段落番号の記載は不要です
- 参考までに、金融の専門用語をいくつか挙げておきます。
  - Bear Market: 弱気相場 (ベアマーケット)
  - Bull Market: 強気相場 (ブルマーケット)
  - Floor Price: フロアプライス
  - range: レンジ相場
  - Stable Coin: ステーブルコイン
  - Changpeng Zhao: CZ
  - total value locked: TVL
  - Liquidation: 清算

=========

title:
{記事タイトル}

text:
{記事本文}

=========

ここからは日本語で書くこと。
必ず800文字以内で簡潔に書いてください。
```

* 翻訳
  * 関連用語の翻訳の仕方を制限
* 要約
  * 著作権のケア
* hallucinationのケア

を主には行っている。

[AIニュース要約サイトを支える技術 〜ChatGPT APIの呪文を添えて〜｜くりぷとべあー](https://note.com/cryptoo_bear/n/naaf453dfb29a#f2bf3c00-8495-4083-abc6-eb9fa7fcb023)

### 記事の重要度推定

```
以下のニュース記事が仮想通貨取引に与える影響を推定してください。
4つの推定値［HIGH、MID、LOW、UNKNOWN］の中から1つを選択してください。

このニュースは、最新の情報を知りたい投資家に読まれています。
市場に影響を与えた過去のニュースには、LOWを付けてください。
つまり、過去ニュースのレビューやその要約はLOWになります。

数時間以内にマーケットに大きな影響を与えるであろう
ニュースには、HIGHを付けてください。

当社では、LOWの評価が基本です。
確実に影響があると思われるもの以外は、
多くのニュースにLOWを付けてください。

HIGHのニュースは、速報性が必要な重要なニュースです。
MIDはその中間ですが、あなたはMIDをつけることが多いので、
なるべくLOWをつけるようにしてください。

参考：以下のニュースは暗号通貨市場に大きな影響を与えるので、
やや高めに採点しなさい。
- 米国当局による暗号通貨の規制
- 暗号通貨に関連する法規制の改廃
- 暗号通貨取引所への罰則
- 株式や債券などの金融市場の変動
- 市場金利の変動
- インフレ率や失業率などの経済指標の変動
- 暗号通貨取引所における上場シンボルの変更
- 大口取引先による資金移動
- 大規模なNFTの販売
- ロック解除イベント
- 暗号通貨のアップグレード

市場への影響が不明なものは、UNKNOWNです。
UNKNOWNラベルは遠慮なく使ってください。

推定値のみ回答しなさい
 ([HIGH、MID、LOW、UNKNOWN]のいずれか1つ以外の値は不要）

==============

title:
{原文記事タイトル}

text:
{記事要約文(日本語)}
```

[AIニュース要約サイトを支える技術 〜ChatGPT APIの呪文を添えて〜｜くりぷとべあー](https://note.com/cryptoo_bear/n/naaf453dfb29a#f2bf3c00-8495-4083-abc6-eb9fa7fcb023)

### 深津式プロンプト

```markdown
# 命令書:
あなたは{プロの編集者}です。
以下の制約条件と入力文をもとに{最高の要約}を出力してください。
# 制約条件:
* 文字数は300文字程度。
* 小学生にもわかりやすく。
* 重要なキーワードを取り残さない。
* 文章を簡潔に。
# 入力文：
{入力文章}
# 出力文：
```

### bashスクリプト生成

`````python
BASH_SCRIPT_PROMPT = """
If someone asks you to perform a task, your job is to come up with a series of bash scripts that will perform that task.
Do not use anything but bash scripts.Take up to two arguments if necessary.
Use the following format and try to explain your reasoning step by step:.
Q: "Copy files in a directory named "target" to a new directory at the same level as target named "myNewDirectory"."
The following actions are required
- Create a nepow directory
- Copy files from the first directory to the second
```bash
#!/usr/bin/env bash
mkdir myNewDirectory
cp -r target/* myNewDirectory
````
"""

LIST_UP_FILENAMES_PROMPT = """
If you were to name this bashscript, what file name would you give it?
Be sure to output 4 candidates
Please follow the example name without the ".sh" and answer with a list of four choices in json format. (ex.["good_one", "something_special", "count_records", "delete_files"])
"""

SUMMARY_PROMPT = """
Please write a description of this bash script.
Condition 1: Must be less than 100 characters
Condition 2: Output should be in the same language as the user's input language.
Condition 3: The description of the operation should be simple.
Condition 4: It is obvious that it is a bash script, so it is not mentioned.
The instructions so far are as follows:
"""

`````

https://github.com/hirokidaichi/wanna/blob/main/wanna/chatter.py 

### 参考

* [ChatGPT Meetup Tokyo #1 - YouTube](https://www.youtube.com/watch?v=bK5PMfox_c8)

## Llama index

主なできること

* 外部データの取り込み（pdf, csv）
* データの構造化（ベクトル化）
* 検索

外部データの取り込み、高度な検索が楽。
取り込んだものをLangChainで利用することも可能

## LangChain

主なできること

* LLM実行とプロンプト生成
* チェーン: 複数のLLMやプロンプトの入出力を繋げる。
* データ拡張生成: 特定のデータに基づいてテキスト生成する
* エージェント: Google検索などのツールと対話する
* メモリ: チェーンやエージェントで状態を保持。
* 評価 (BETA)

## Agent（LLMの技術を用いた自律型エージェント）

Agentとは下記のような役割をするもの（明確な定義は見つけられなかったので各所のまとめ）

* 人間のインプットを元に自律的に行動を選択する
* 外部ツール（検索、APIリクエスト、ファイル操作など）を適宜使用
* 実行結果（エラーも含め）を元に行動の修正
* 実行したことを記憶している

### 懸念点

* 精度
  * 最初のインプット（ゴール）が曖昧だとアウトプットはもちろんぶれる
  * 無限ループに陥ることがある
* 推論を繰り返すので・・
  * コスト↑
  * 時間↑
    * （もちろん何をするかとどんな手順をとるかによるが）5~10分待つぐらいの肌感

### 参考

* [全自動でデータ分析してくれるAIエージェントを作った - Speaker Deck](https://speakerdeck.com/dory/llm-agent-meetuptokyo2)
* [LLM Meetup Tokyo #2 手続きを記憶するコマンド型エージェントの実装 - Speaker Deck](https://speakerdeck.com/rynsuke/llm-meetup-tokyo-number-2-shou-sok-kiwoji-yi-surukomantoxing-esientonoshi-zhuang)
* [LLM Meetup Tokyo #2 開催レポ＆LTまとめ｜mah_lab / 西見 公宏](https://note.com/mahlab/n/n24d04dc996e7)

### [AgentGPT](https://github.com/reworkd/AgentGPT)と[AgentGPT](https://github.com/Significant-Gravitas/Auto-GPT)

> AgentGPTは、
>
> * ユーザーが設定したゴールをAIにいくつかの問い（タスク）に分解させる
>
> * それぞれの問いに回答を出させ、その結果を踏まえて追加で必要な問いを考えさせてタスクリストに追加する
>
> という自問自答のループを回すことで思考を深めています。
>
> 一方、Auto-GPTでも似たようなループを回す点は同じですが、さらに実験的なことをしています。
>
> - Google検索
> - ウェブページの閲覧
> - ファイルの読み書き
> - Pinecone（ベクトルDB）の利用
> - PythonやShellスクリプトの実行
> - GPT-3.5へのプロンプト入力（コスト低減のため）
>
> といった処理を行えるコマンドをGPT-4に使わせることで、情報の探索と処理を行いながら長期記憶も駆使して思考プロセスを進めるようにしています。

[「Auto-GPTとAgentGPTは別物です」という話](https://zenn.dev/kecy/articles/7349a3969e2de6)

## ReAct

> LLMのpromptingの方法の一つです。LLMに質疑応答させたり、意思決定させたりという場面で力を発揮するほか、外部データベースや外部APIとLLMを組み合わせる場合にも使えます。
> また、LangChainでもReActの考え方は多く活用されています（エージェントなど）

[【Prompt Engineering】LLMを効率的に動かす「ReAct」論文徹底分解！😎](https://zenn.dev/ryo1443/articles/d727b2b9a6d08c) より

ReAct論文: [[2210.03629] ReAct: Synergizing Reasoning and Acting in Language Models](https://arxiv.org/abs/2210.03629)

> LLMは凄まじい成果を発揮しているが、推論（Chain of Thoughtなど）と行動（検索・計画の生成などなど）については別テーマとして研究されてきた。本論文では、LLMを使用して推論と行動の両者を活用し、2つの相乗効果を生む方法（ReAct）を提案する。
> 　ReActを様々な言語タスクと意思決定タスクに適用し、効率性を実証する。具体的には、質疑応答と事実検証においてWikipediaAPIを活用して種々の問題を克服する。更に、2つの対話型の意思決定ベンチマーク（ALFWorldとWebShop）について、promptに1つか2つの例を入れるのみで、模倣学習と強化学習に対して34%と10%の成功率の向上を上げた。

## ファインチューニング

> 　機械学習（厳密にはニューラルネットワーク）における**ファインチューニング**（**Fine-tuning**：**微調整**）とは、あるデータセットを使って**事前学習**（**Pre-training**）した訓練済みモデルの一部もしくは全体を、別のデータセットを使って再トレーニングすることで、新しいタスク向けに機械学習モデルのパラメーターを微調整することである（図1）。一般的に、再トレーニングの際の学習率はより小さな値にするため、既に調整済みのパラメーターへの影響もより小さなものとなる。

[ファインチューニング（Fine-tuning：微調整）とは？：AI・機械学習の用語辞典 - ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/2301/26/news019.html)

## アンサンブル学習

> アンサンブル・メソッドを用いた[機械学習](https://ja.wikipedia.org/wiki/機械学習)である。統計や機械学習で使われるアンサンブル・メソッドでは、さまざまな学習[アルゴリズム](https://ja.wikipedia.org/wiki/アルゴリズム)の有限集合を使用することで、単一の学習アルゴリズムよりも優れた結果を得る。

[アンサンブル・ラーニング - Wikipedia](https://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%B3%E3%82%B5%E3%83%B3%E3%83%96%E3%83%AB%E3%83%BB%E3%83%A9%E3%83%BC%E3%83%8B%E3%83%B3%E3%82%B0)

## Temperature

> The temperature determines how greedy the generative model is.
>
> If the temperature is low, the probabilities to sample other but the class with the highest log probability will be small, and the model will probably output the most correct text, but rather boring, with small variation.
>
> If the temperature is high, the model can output, with rather high probability, other words than those with the highest probability. The generated text will be more diverse, but there is a higher possibility of grammar mistakes and generation of nonsense.

https://ai.stackexchange.com/a/32478

## 気になった記事など

* 読めてないが気になるもの
  * [ChatGPT Meetup Tokyo #3 - 資料一覧 - connpass](https://chatgpt.connpass.com/event/284058/presentation/)
  * [LLM in Production Meetup #0 kick off - 資料一覧 - connpass](https://llm-in-production.connpass.com/event/287806/presentation/)
  * [生成系AIの実応用に向けて - Speaker Deck](https://speakerdeck.com/line_developers/toward-practical-applications-of-generative-ai)

* [ChatGPT Plugins Don't Have PMF](https://matt-rickard.com/chatgpt-plugins-dont-have-pmf)

  * 記事「ChatGPT Plugins Don't Have PMF」では、Sam Altmanの視点から、ブラウジングプラグインを除くChatGPTプラグインがプロダクトマーケットフィット（PMF）を持っていないと述べられている。そして、近いうちにAPIに追加される可能性は低いとされている。著者はこの状況についていくつかの仮説を提示している。

    **コンセプトは正しいが、まだ十分ではない**: GPT-4は間違ったプラグインを選択するか、複数の呼び出しを確実に連鎖させることができないかもしれない。著者は、ほとんどのエージェントやプラグインフレームワークがこの問題に直面していると指摘している。外部APIへの呼び出しを開始できるかもしれないが、しばしば壊れやすく、誤動作を起こすことが多い。キラーアプリもない。より強力なワークフローは、より多くのプラグインを同時に呼び出すことができる大きなコンテキストウィンドウで解放されるかもしれないと著者は提案している。

    **コンセプトが間違っている**: Altmanは、多くの人々が自分たちのアプリをChatGPTの中に欲しいと思っていたが、実際にはChatGPTを自分たちのアプリの中に欲しいと思っていたと発言している。また、著者は言語モデルは「横方向」の拡張を持つだろうと提案している。つまり、ウェブ検索やデータベースに接続するが、App Storeのようなインターフェースを通じて一般的なAPIを呼び出すことはないだろう。

    **コンセプトは正しいが、実装が間違っている**: チャットがプラグインにとって適切なユーザーエクスペリエンスでない可能性があると著者は提案している。他の潜在的な問題としては、現在の価格で提供するコスト、より広範な採用の必要性、成功したアプリストアを構築する難しさなどが挙げられている。

  * 使う人にも依る。LLMの実用としていろいろできるコンシェルジュ、というイメージがありそういう意味でコンシェルジュが利用する道具が増えるという意味でpluginのコンセプトは適している。一方で使いづらさ、いまいちさがあるのも事実。応答速度や正確性、操作性がやはり気になる。プラグインを選ぶというよりそこさえも自動でやってくれるUXを求めているところがある。ということで個人的には「コンセプトは正しいが、まだ十分ではない」寄りの意見である。大衆にはアプリの中でAI（ChatGPTなど）を用いる方が受けるは自然。OpenAIとしてはpluginというコンセプトは間違っていないと思う。

* [(3) ChatGPT Hack Online Session（AI+Crypto Hackathon サイドイベント） - YouTube](https://www.youtube.com/watch?v=eJn08_bgecM)

  * AIプロダクトを開発する上での注意点、サイト内検索でのOpenAI APIの活用事例、AlexaでのOpenAI APIの活用事例

* [AIもうええわい – WirelessWire News](https://wirelesswire.jp/2023/04/84527/)

  * AIの進化早い、1ヶ月という単位でみても大きな変化が起きている
  * > もう少し現代的な感覚で説明すると「毎週iPhoneの新機種が出る」くらいの感覚だろうか。
  もしもそうなったら、「どれを買えばいいというのか」と悩むだろうし、「今最新機種を買っても、来週にはまた別の最新機種が出てるのでは?」と疑心暗鬼になる
  * > Microsoft、Googleといったクローズドでプロプライエタリ(非公開・独占・私有的)なAIと、オープンソースのAIの戦いになっている。
* [「オープンソースは脅威」「勝者はMeta」「OpenAIは重要ではない」などと記されたGoogleのAI関連内部文書が流出 - GIGAZINE](https://gigazine.net/news/20230508-google-document-llm-arms-race/)
  * 2022年から2023年にかけて、大規模言語モデル（LLM）の開発競争が激化した。OpenAIの「GPT-4」、Metaの「LLaMA」、Stability AIの「StableLM」などが発表さた。Googleは、競合他社を分析し、オープンソースの脅威について詳細を記した内部資料が流出したと発表した。Googleは、オープンソースが勝利すると述べており、クローズドな環境からの転換を提案している。MetaのLLaMAのデータがインターネット上に流出したが、それはむしろメリットになっている。なぜならオープンソースのイノベーションはMetaのアーキテクチャの上で起こるので、Metaがその技術を直接自社の製品に取り入れることが可能だから。LLaMAをしのぐ性能を持つオープンソースの大規模言語モデル「Vicuna-13B」公開された。Googleは、オープンソースのモデルが低コストで高品質な性能を持つことを指摘し、協力することの重要性を強調している。オープンソースのモデルは特に画像生成の分野で革新的な技術を生み出しており、Googleはその影響力を認識していGoogleは、オープンソースの脅威と言語モデルの効率化技術である「LoRA」についても懸念を表明している。Googleは自社技術の秘密保持とオープンソース化の選択肢を考慮しており、競争優位性の維持が難しくなっていると認識してい。Googleは、Metaがオープンソースのイノベーションを活用できる一方で、OpenAIはオープンソースの姿勢を変えない限り競争で自分たちが先手を打つことができると主張している。Googleはオープンソースコミュニティのリーダーとしての地位を確立し、協力を重視すべきだと提案している。
* [The Age of AI has begun | Bill Gates](https://www.gatesnotes.com/The-Age-of-AI-Has-Begun)
  * 2023/3月時点でAIの人間の生活への影響についての想定がわかる
  * ビル・ゲイツがAIの時代について述べたもの。彼はAIが革命的な技術であり、マイクロプロセッサ、パーソナルコンピュータ、インターネット、携帯電話の創造と同じくらい基本的な開発であると述べている。AIは人々の働き方、学び方、旅行の方法、医療の受け方、コミュニケーションの方法を変える。また、AIは世界の最悪の不平等を減らすことができ、特に教育と健康において大きな可能性があると述べている。しかし、AIの発展には様々なリスクが伴う。それは労働力、法制度、プライバシー、バイアスなどについての難しい問題を提起します。また、AIはHallucinationをにより、幻覚を経験させることもある。それにもかかわらず、ビル・ゲイツはAIの可能性について非常に楽観的で、その影響力と可能性について深く考えることを促している。 
* [Hallucination (artificial intelligence) - Wikiwand](https://www.wikiwand.com/en/Hallucination_(artificial_intelligence))

## memo


* gptをメインに使ったサービス、いきなり抽象化しようとして開発のハードルが個人的に上がっている。メインコンテンツ提供はサービス提供者側が作成し、その読み取りIFをつくるという構造が最初はシンプルでいいかも。ユーザー毎の要求に応える系のは後にした方が良さそう。ユーザーのapikeyを使うにしても、embedしたのを持ちたくなりそれをどこに置くかを気にすることになる。
  
* https://twitter.com/shinzizm2/status/1667312129966501888
  
  
  * > 私のgptは、pdf読み取り、文章読み取り、ウェブクローラー、サーチ、リンク解析してさらに必要なページを探して、読み込みという機能があるのですが、調査をすると、決算レポートは出てくるし、会話する際に記憶も色々な側面で呼び出してくるので、まとめレポートも作れます
  
* AI活用プロダクトの評価軸としては下記がありそう


  * 使いやすさ

    * UI/UX

  * AIによって解決できる問題の広さ

    * 狭いから悪いというわけではない

  * AIの解決力

    * 曖昧さがなく、正しい答え/提案が得られる

* AI関連プロダクト開発

  * 3ヶ月後リリースとかだとすでに状況が変わっていそう
  * リサーチは開発者がやるのかすでにある程度リサーチ済みなのか
  * > 技術の迅速な進化: AIの技術は日進月歩で進化しており、そのペースは止まる気配を見せません。そのため、プロジェクトの進行中にも新しい手法やツールが登場する可能性があります。このような状況では、常に最新の技術動向を把握し、可能であればそれを取り入れることが重要となります。ただし、最新技術の導入にはリスクも伴いますので、そのリスク評価も行う必要があります。  
  契約内容: AIの開発はタイムラインが長いことが多く、特に研究段階では結果が出るまでに時間がかかる場合があります。そのため、報酬については明確な契約が必要となります。報酬は開発の進捗によって段階的に支払われることが一般的ですが、それについては個別の契約内容によります。  
  データプライバシーと倫理: AIプロダクトの開発においては、データプライバシーや倫理に配慮することが重要です。特に、ユーザーから得られるデータを使用する場合、そのデータの取り扱いについては法律や規範を遵守する必要があります。  
  利用シナリオと利益: AIプロダクトが実際に価値を創出するためには、その利用シナリオが明確である必要があります。また、開発の初期段階から利益モデルを設計し、プロダクトが収益を上げることができるかどうかを評価することが重要です。

AIの限界の理解: AIは非常に強力なツールですが、全てを解決する万能薬ではありません。AIが得意とするタスクと限界を理解し、それをビジネスニーズに適切にマッチさせることが必要です。

* json色付け→AI（コンピュータ）のアウトプット色付けだなあと
  そのうち色付けるとこもAIがしてくれるようになるだろうが
  * 開発フローの遷移
    * requester → エンジニアwith AI → サービス
    * requester → AI（もちろん色付けも） → サービス
    * requesterが認識しなくとも自動で適切なサービスが適切なタイミングで提供される

* Agentのコスト高い問題、途中のはllmがわかる言葉でやるとトークン数削減できるのでは？

* OpenAIのAPIを利用したサービスについて

  * UI/UXを工夫してChatGPTでやるより楽にしてるよ系
    * たくさん
    * プラットフォームに乗せることで
    * 利用幅を広げる系もこれ
      * LINE: AIチャットくん
      * AI Type: キーボード

  * ChatGPTでやるのがそもそも難しいもの系
    * デザイン作成での利用
    * Agentの利用
