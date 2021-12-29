## コンパイル/ビルド周りの設定覚書

+  ビルドせずに前回のビルド状態でRunする

```
Cmd + Ctrl + R
```



* ビルド時間の表示

```
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
```



* ビルド時のタスク数を適正なものにする

コア数を確認する（Total Number of Cores: {}）

```
system_profiler SPHardwareDataType
```

並列タスク数の設定（デフォルトで設定されてるかもですが）

```
defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks {コア数}
```

この設定によりタスクが並列実行されビルドが早くなる可能性があります。



* Xcode SettigsのCompilation ModeとOptimization Modeの設定について

コンパイル種別と最適化設定についてです。
基本的には下記あるような設定でいいと思います。

> When you build a program in Xcode or using `xcodebuild`, often there is a *configuration* parameter that will switch both of these modes simultaneously. That is, typical code has two configurations:
>
> - **Debug** which combines primary-file mode with `-Onone`
> - **Release** which combines WMO mode with `-O`
>
> But these parameters can be varied independently and the compiler will spend its time very differently depending on their settings, so it's worth understanding both dimensions in a bit more detail.

引用: [Swift Compiler Performance](https://github.com/apple/swift/blob/954fc46a7d39906e9ebd54b5f9c4dbce8c03c343/docs/CompilerPerformance.md)



* Build Active Architecture Only の設定

対象のアーキテクチャ（例えばarm64）のみのビルドを行う。デバッグ時などはその対象端末だけでビルドできればいいのでYesに設定しても良いが（ビルド早くなると思います）、リリースビルドでこれを設定するとエラーでapp store connectにアップロードできないので注意。



* 型推論

型の解決はコンパイル時に行われます。つまりアプリのランタイム時のパフォーマンスには影響を与えませんが少なくとも型を明示的に書くことはビルド時間の改善に貢献します。
簡単に推論できるものは良いですが、例えばfuncの戻り値を変数に格納しそれを型推論に任せる場合は少し複雑になります。またそれはコードを書く人にとっても親切ではありません。
型が一目でわからない or 型推論が複雑そうと思ったら明示的に書きましょう。

下記をプロジェクトのBuild Settings -> Other Swift Flagsに追加（100は100m秒を示します。任意に設定して下さい）することで型推論に時間がかかっている箇所で警告が出ます。

```
-Xfrontend -warn-long-expression-type-checking=100
```

これにより、問題の箇所が明確になると思います。ただ、計測に時間がかかるので改善対象を見つける際に利用するに留めるので良いと思っています。

参考: [Faster Swift Builds: Leaving Type Inference Behind](https://www.linkedin.com/pulse/faster-swift-builds-leaving-type-inference-behind-dan-zinngrabe)



* コンパイルに時間がかかる処理を見つける

下記をプロジェクトのBuild Settings -> Other Swift Flagsに追加（100は100m秒を示します。任意に設定して下さい）

```
-Xfrontend -warn-long-function-bodies=100
```

計測に時間がかかるので改善対象を見つける際に利用するに留めるので良いと思っています。（同上）