## GCDの概要

<img width="487" alt="ios gcd" src="https://user-images.githubusercontent.com/20992687/93784965-8700db00-fc68-11ea-9343-ec38e5033f54.png">



> あなたがブロックをコンカレントキューに `dispatch_async` した時、GCD はスレッドプールからアイドリングしているスレッドを探し、そのスレッドでブロックを動かそうとします。そしてもしアイドリングなスレッドが見つからなかった時、仕方ないのでその仕事のために**新しいスレッドを作る**しかありません。そのため、速いペースでブロックをコンカレントキューにディスパッチすると、速いペースで新しいスレッドを作らなくてはならないことになりかねないです。
>
> 忘れないでください：
>
> - スレッドの作成は[ただではありません](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/CreatingThreads/CreatingThreads.html#//apple_ref/doc/uid/10000057i-CH15-SW7)。もしあなたが出したブロックの仕事量が少ない（< 1ms）なら、新しいスレッドの作成は非常に無駄です、なぜならそれには実行コンテキスト、CPU サイクル、そして dirty メモリ等のスイッチングが発生するからです。
> - GCD は喜んであなたにスレッドを作成しちゃいます、結果的に[スレッド爆発](https://twitter.com/pedantcoder/status/773903697474486273)が起こります。
>
> 一般的には、常に**数の限られたシリアルキューからスタートすべき**で、それぞれのキューにあなたのアプリのサブコンポーネント（DB キュー、テキスト処理キュー、などなど…）を現すべきです。そして自分自身のシリアルキューを持つ小さいオブジェクトには、`dispatch_set_target_queue` を使って先ほどのサブコンポーネントキューにターゲットセットすればいいです。
>
> あなたのボトルネックが**追加の並列化で解決できる時**のみ、あなたが作ったコンカレントキュー（`dispatch_get_global_queue` ではなく）を使い、そして [`dispatch_apply` の利用を考えましょう](https://developer.apple.com/documentation/dispatch/1453050-dispatch_apply)。
>
> `dispatch_get_global_queue` についての注意：
>
> あなたが `dispatch_get_global_queue` から取得したコンカレントキューは、**システムへの QoS[1](https://qiita.com/lovee/items/93d656c4c20c362b070a#fn1) 情報の転送が苦手であり、回避すべき**です。



参考  

* [A Guide to Grand Central Dispatch and Concurrency in iOS](https://swiftludus.org/using-grand-central-dispatch-and-concurrency-in-ios/)
* [【翻訳】あなたの（多分）まだ知らない iOS パフォーマンスアドバイス（元アップルエンジニアから）](https://qiita.com/lovee/items/93d656c4c20c362b070a)