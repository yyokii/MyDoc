# デザイン

## Tips

* 効率的/自然/多様性があるといい
* まとめられるものはまとめてみるのもあり
  * 認証情報入力が多段階あるものについて、いくつかの要素をまとめたり画面削除したりできないか？
* プロトタイプを見せながら進めるのが共通理解を早い段階で築けるので有効
  * 2ヶ月ぐらい必要？
* [【WWDC21】Recap Discoverable design - Qiita](https://qiita.com/yyokii/items/92ded62a339fd01a06e0)

![Discoverable_design 008](https://user-images.githubusercontent.com/20992687/124152996-fa285f00-dace-11eb-8079-30b08e79ee45.jpeg)

## デザインとは何か

> ### デザインとは、デザインの定義
>
> デザイン（英:[design](https://www.weblio.jp/content/design)）とは、「[美しさ](https://www.weblio.jp/content/美しさ)」や「[使いやすさ](https://www.weblio.jp/content/使いやすさ)」などの[狙い](https://www.weblio.jp/content/狙い)を[実現](https://www.weblio.jp/content/実現)するために[創意工夫](https://www.weblio.jp/content/創意工夫)すること、および、その[創意工夫](https://www.weblio.jp/content/創意工夫)の[成果](https://www.weblio.jp/content/成果)を[反映](https://www.weblio.jp/content/反映)させた[見た目](https://www.weblio.jp/content/見た目)や[機能](https://www.weblio.jp/content/機能)の[あり方](https://www.weblio.jp/content/あり方)のこと。[多く](https://www.weblio.jp/content/多く)の[場合](https://www.weblio.jp/content/場合)「[図案](https://www.weblio.jp/content/図案)」「[模様](https://www.weblio.jp/content/模様)」「[設計](https://www.weblio.jp/content/設計)」「[造形](https://www.weblio.jp/content/造形)」「[構想](https://www.weblio.jp/content/構想)」など[と言い](https://www.weblio.jp/content/と言い)[換え](https://www.weblio.jp/content/換え)られる[意味合い](https://www.weblio.jp/content/意味合い)で用いられる。

[デザインとは何？ Weblio辞書 実用日本語表現辞典](https://www.weblio.jp/content/%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3)

この表現は我々がデザインとは何かを考えた時の感覚にも近い。つまりそれは絵をを書くことであったり家具を作ったり服をコーディネートしたりすることであり、そして創意工夫自体もデザインである。
ここでは「その[創意工夫](https://www.weblio.jp/content/創意工夫)の[成果](https://www.weblio.jp/content/成果)を[反映](https://www.weblio.jp/content/反映)させた[見た目](https://www.weblio.jp/content/見た目)」に焦点を当てる。

そもそもなぜデザインをするのか。それは伝えたいものがあるからである。
伝えたいものがあるということは次のような質問にも答えられるはずだ。

* 伝えたいもの（テーマ）は何か
* 誰に伝えたいのか
* いつ伝えたいのか
* どこ（どの媒体）で伝えたいか

これらがデザインをしていく上での前提となる。

次に見た目を構成する要素を見ていく。

* 形（線、2次元、3次元）
* タイポグラフィー（文字）
* 色
* 配置
* 質感
* 動き

これらが、前提やその時のチーム、プロジェクトの状態に従って絞られていく。
しかしそれだけでは決まらない。我々がデザインに期待しているものも意識する必要がある。

* 楽しさ
* ユーザビリティ
* 機能性
* 信頼性

これらを段階的に満たしてく必要がある。
そしてそれらを助けるのがいくつかのデザイン原則である。
基本的なものとしては以下のものがある。

1. 近接 Proximity
2. 整列 Alignment
3. 強弱 Contrast
4. 反復 Repetition

### 参考

* [デザインの欲求階層説 | UX TIMES](https://uxdaystokyo.com/articles/glossary/designhierarchyofneeds/)
* [感覚派デザイナーも知っておいて損はない「デザインの要素と原則」 | WebNAUT](https://webnaut.jp/design/620.html)
* [これだけ守れば見やすくなるデザインの基礎 - Speaker Deck](https://speakerdeck.com/kinakobooster/koredakeshou-rebajian-yasukunarudezainfalseji-chu)
* [UIデザインをはじめよう - Speaker Deck](https://speakerdeck.com/kinakobooster/uidezainwohazimeyou)
* [今日からできるUXデザイン - Speaker Deck](https://speakerdeck.com/kinakobooster/jin-ri-karadekiruuxdezain)

## The Obvious UI is Often the Best UI

[The Obvious UI is Often the Best UI | by Susanna Zaraysky | Google Design | Medium](https://medium.com/google-design/the-obvious-ui-is-often-the-best-ui-7a25597d79fd) より

* コンポーネントの配置について

  * 主要機能はユーザーに分かりやすいところに置く
  * ハンバーガーメニューやプルダウンメニューの中におくと見つかりにくい
  * 例えばボトムバーにしたりトグルにすることで機能があることを明確にできる
    * またボトムバーについて言えば、下部にあることで人間工学的にもアクセシビリティ的にも有効である

* アイコンについて

  * 年代や属性によっては意味が通じないアイコンがあることを意識する
    * 「フロッピーディスクのアイコン」で保存を示したり「ドルマークのアイコン」でお金を表すことは適切でないことがあるよね
    * アイコン+テキストの説明が効果的
    * テキストだけでもよい。そしてヒントテキストも効果的。

* 良いデザインをするために・・

  * > 何年もの使用データを待たずに、また研究者を雇わずに、デザイナーはどうやってユーザーにとって何が明白で常識的なのかを知ることができるのでしょうか？「痛みに近ければ近いほど、それを解決したいと思うものです」とWroblewskiは言います。自分が抱えている問題を解決するために製品を作っているのであれば、その製品の中核となる機能や、それがどのように問題を解決するのかを知っているはずです。
    > 自分がターゲットユーザーでない場合は、ユーザーを観察し、学び、反復しなければなりません。そのためには、莫大な調査費や旅費は必要ありませんし、大量の使用データを持っている必要もありません。潜在的なユーザーや既存のユーザーと話をして、彼らが抱えている問題を見つけたり、自分がユーザーになったつもりで考えたりすることです。ウォブルフスキーは、RITE（Rapid Iterative Testing and Evaluation）テストを推奨している。「毎週、開発したものを人間の目の前に置いて、その人が使ってみるのを見ます。常に、お客様や潜在的なお客様と一緒にいることに戻るのです。デザイナーが『この人と一緒に座ってみたら、この人は私たちのデザインに失敗して、やりたいことができなかった』と言えば、それはとても直感的でリアルなことです。
    > 頻繁に、そして定期的にユーザーと過ごすことで、あなたのデザインはより適切に、適切に、そして "明らかに "なるでしょう。問題空間を理解して初めて、"当たり前 "や "常識 "を明確に理解し、使いやすいデザインを生み出すことができるのです。