# AI

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

## LangChain

できること

* LLM実行とプロンプト生成
* チェーン: 複数のLLMやプロンプトの入出力を繋げる。
* データ拡張生成: 特定のデータに基づいてテキスト生成する
* エージェント: Google検索などのツールと対話する
* メモリ: チェーンやエージェントで状態を保持。
* 評価 (BETA)


## Temperature

> The temperature determines how greedy the generative model is.
>
> If the temperature is low, the probabilities to sample other but the class with the highest log probability will be small, and the model will probably output the most correct text, but rather boring, with small variation.
>
> If the temperature is high, the model can output, with rather high probability, other words than those with the highest probability. The generated text will be more diverse, but there is a higher possibility of grammar mistakes and generation of nonsense.

https://ai.stackexchange.com/a/32478

