# AI

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
サービスを単に作るというよりは、その後の改善サイクルの回数と質がより大事になりそう。

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

![gpt azure architecture](/Users/yoki/Desktop/スクリーンショット 2023-05-21 21.02.26.png)

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


### プロンプト

bashスクリプト生成

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

## LangChain

できること

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

## 気になった記事

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
