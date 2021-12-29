# Docker

## よく使うコマンド群

| コマンド                                                     | 用途                                                | 補足                                   |
| ------------------------------------------------------------ | --------------------------------------------------- | -------------------------------------- |
| `docker image build -t イメージ名[:タグ名] Dockerfileのあるディレクトリ ` | docker image のビルド                               | `-t`(`--tag`)： 名前とタグを設定できる |
| `docker ps`                                                  | 実行中のコンテナを表示                              | `-a` : 全て表示                        |
| `docker run -it -p 9005:9005 {任意のdocker image名} /bin/sh` | コンテナ起動（ポートの指定、Containerのシェル利用） |                                        |
| `docker rm $(docker ps -a -q)`                               | コンテナを全て削除                                  |                                        |
| `docker stop $(docker ps -q)`                                | 稼働中のコンテナを全て止める                        |                                        |

## Docker File

### 環境変数

| 環境変数     | 記法                                                         | 用途                                                         | サンプル                                                     | 補足                                                         |
| ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `ADD`        | `ADD <ソース>... <送信先>`<br />`ADD ["<ソース>", ... "<送信先>"]`（（この形式はパスに空白スペースを使う場合に必要）） | `<ソース>` にある新しいファイルやディレクトリをコピー、あるいはリモートの URL からコピーします。それから、コンテナ内のファイルシステム上にある `送信先` に指定されたパスに追加します。 | `ADD test relativeDir/`<br />→ "test" を `WORKDIR`/relativeDir/ （相対ディレクトリ）に追加 |                                                              |
| `COPY`       | `COPY <ソース>... <送信先>`<br /> `COPY ["<ソース>",... "<送信先>"]` （この形式はパスに空白スペースを使う場合に必要） | `<ソース>` にある新しいファイルやディレクトリをコピーするもので、コンテナ内のファイルシステム上にある `<送信先>` に指定されたパスに追加します。 | `COPY test relativeDir/`<br />→ "test" を `WORKDIR`/relativeDir/ （相対ディレクトリ）に追加 | `ADD`と`COPY`の違い<br />→ 対象が圧縮ファイルの場合、`ADD`は自動解凍され、`COPY`は自動解凍されない |
| `ENV`        | `ENV <key> <value>` <br />`ENV <key>=<value> ...`            | 環境変数 `<key>` と 値 `<value>` のセットです。値は `Dockerfile` から派生する全てのコマンド環境で利用でき、 [インラインで置き換え](http://docs.docker.jp/v1.11/engine/reference/builder.html#environment-replacement) も可能です。 | `ENV myName="John Doe" myDog=Rex\ The\ Dog \     myCat=fluffy` |                                                              |
| `EXPOSE`     | `EXPOSE <port> [<port>...]`                                  | 特定のネットワーク・ポートをコンテナが実行時にリッスンすることを Docker に伝えます。 `EXPOSE` があっても、これだけではホストからコンテナにアクセスできるようにしません。アクセスするには、 `-p` フラグを使ってポートの公開範囲を指定するか、 `-P` フラグで全ての露出ポートを公開する必要があります。外部への公開時は他のポート番号も利用可能です。 |                                                              |                                                              |
| `FROM`       | `FROM <イメージ>`<br />`FROM <イメージ>:<タグ>`<br />`FROM <イメージ>@<digest>` | `FROM` 命令は、以降の命令で使う [ベース・イメージ](http://docs.docker.jp/v1.11/engine/reference/glossary.html#base-image) を指定します。 |                                                              |                                                              |
| `LABEL`      | `LABEL <key>=<value> <key>=<value> <key>=<value> ...`        | イメージにメタデータを追加します。 `LABEL` はキーとバリューのペアです。 `LABEL` の値に空白スペースを含む場合はクォートを使いますし、コマンドラインの分割にバックスラッシュを使います。 | `LABEL "com.example.vendor"="ACME Incorporated"`<br />`LABEL version="1.0"` |                                                              |
| `STOPSIGNAL` | `STOPSIGNAL シグナル`                                        | コンテナを終了する時に送信するための、システム・コール・シグナルを設定します。シグナルはカーネルの syscall テーブルと一致する、有効な番号の必要があります。例えば、9 あるいはシグナル名 SIGNAME や、 SIGKILL などです。 |                                                              |                                                              |
| `USER`       | `USER daemon`                                                | ユーザ名か UID を使います。これはイメージで `RUN` 、 `CMD` 、 `ENTRYPOINT` 命令を実行するユーザーとなります。 |                                                              |                                                              |
| `VOLUME`     | `VOLUME ["/data"]`                                           | 指定した名前でマウントポイントを作成し、他のホストやコンテナから外部マウント可能なボリュームにします。指定する値は `VOLUME ["/var/log"]` といったJSON 配列になるべきです。あるいは文字列で `VOLUME /var/log` や `VOLUME /var/log /var/db` のように、複数の引数を書くこともできます。 | `VOLUME /myvol`                                              |                                                              |
| `WORKDIR`    | `WORKDIR /path/to/workdir`                                   | `Dockerfile` で `RUN` 、 `CMD` 、 `ENTRYPOINT` 、 `COPY` 、 `ADD` 命令実行時の作業ディレクトリ（working directory）を指定します。もし `WORKDIR` が存在しなければ、 `Dockerfile` 命令内で使用しなくてもディレクトリを作成します。 |                                                              |                                                              |
| `ONBUILD`    | `ONBUILD [命令]`                                             | イメージは他で構築したイメージを元にしている時、`ONBUILD` 命令はイメージに対して最終的に実行する *トリガ* 命令を追加します。トリガは構築後に行うもので、 `Dockerfile` で `FROM` 命令のあとに書くことができます。 |                                                              |                                                              |

参考

* [Dockerfile reference | Docker Documentation](https://docs.docker.com/engine/reference/builder/)
* [Dockerfile リファレンス — Docker-docs-ja 1.11.0 ドキュメント](http://docs.docker.jp/v1.11/engine/reference/builder.html)
* [Dockerfile の ADD と COPY の違いを結論から書く - Qiita](https://qiita.com/YumaInaura/items/1647e509f83462a37494)

## ポートフォワーディング

`docker run`するとときに`-p`オプションで次のように設定することでホスト側とコンテナ側のポートを指定することができる。

`$ docker run -p 9000:8080 aabbcc `

この場合、9000番がホスト側、8080側がコンテナ側のポートとなる。
これにより、外部から9000番ポートで接続された場合にコンテナの8080番ポートに繋がる。

## `Run apt-get`

`apt-get`とは

Debianプロジェクトが開発したパッケージ管理システムであり、Debian系のディストリビューション（DebianやUbuntu）のパッケージ管理システムであるAPT（Advanced Package Tool）ライブラリを利用してパッケージを操作・管理するコマンド。
パッケージがアップロードされているサーバーに問い合わせて所望のパッケージのダウンロードからインストール、依存関係があるパッケーのインストールが行われる