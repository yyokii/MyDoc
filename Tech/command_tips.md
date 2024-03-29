## ターミナルでよく利用するコマンド群

ターミナルでよく利用するコマンド群（Unix系OS、とりわけMac OSでの動作となります）

| 用途                                                         | コマンド                                     | メモ                                                         |
| ------------------------------------------------------------ | -------------------------------------------- | ------------------------------------------------------------ |
| ファイルの中身を表示                                         | `cat`                                        | 行番号をつける: -n                                           |
| 簡易テキストファイル作成                                     | `cat > {ファイル名}`                         | 「control + c」で保存                                        |
| ディレクトリ移動                                             | `cd`                                         | 絶対パスの場合は `/` を頭につける                            |
| 出力結果を捨てる                                             | `command > /dev/null 2>&1`                   | 標準出力/標準エラー出力先を/dev/null にしている              |
| ディレクトリを作成する                                       | `mkdir -p`                                   | `-p` は `-parents` の略<br />必要に応じて親ディレクトリも作成する |
| 任意のファイルのパスを検索する                               | `find . -name "{検索対象}"`                  | 拡張子指定: find . -name "*.html"                            |
| ディレクトリの中身を表示                                     | `ls`                                         | list directory contents<br />隠しファイルも:  -a<br />1行ずつ表示: -1<br /> |
| 任意の名称のファイルを探す                                   | `ls -1 grep   {検索文字}`                    | 複数指定（or）: -e {検索文字} -e {検索文字}                  |
| 現在の作業ディレクトリを表示                                 | `pwd`                                        | present working directory                                    |
| 処理を現在のシェルで実行する                                 | `source`                                     | bashやshコマンドでも実行は可能だが、それらの場合は子プロセス内での実行となる。本コマンドの場合は現在のシェル内での実行となるため、現在のシェルへの影響を持つ |
| リダイレクト                                                 | `>`                                          | 以左のコマンドの実行結果の出力先を任意のパスに設定する       |
| 実行しているシェルスクリプトの相対パスを取得する             | `$0`                                         | 例えば以下のような出力が得られる<br />`/Users/yoki/Desktop/test.sh` |
| 依存しているライブラリを表示する                             | `otool -L {実行ファイル}`                    |                                                              |
| 差分があり且つコミットされていないファイルを、任意の文字で検索してステージングにあげる | ```git ls-files -m | grep 'B' | xargs git add``` | `-o`にすることでuntracked fileを対象にできる                 |

## cURL

| オプション | 効果                           | 備考                       |
| ---------- | ------------------------------ | -------------------------- |
| `-s`       | 進捗やエラーなどの出力をしない | `--silent`                 |
| `-d`       | データを設定                   | `@-`標準入力をデータとする |

### 試す

[httpbin](https://httpbin.org/)

> A simple HTTP Request & Response Service.

### curlでpostするサンプル

```curl
curl -s -X POST "https://api.github.com/repos/${REPO}/git/refs" \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  -d @- << EOS
{
  "ref": "refs/tags/${TAG}",
  "sha": "${COMMIT}"
}
EOS

```

`<< EOS` ~ `EOS`でヒアドキュメントになる。（`EOS`の文字列はなんでも良い）

## `command > /dev/null 2>&1` の順序について

ケース１：`2>&1 >/dev/null`

| 時系列           | 標準出力         | 標準エラー出力               |
| :--------------- | :--------------- | :--------------------------- |
| 初期状態         | 端末             | 端末                         |
| `2>&1`時点       | 不変。つまり端末 | 標準出力をコピー。つまり端末 |
| `>/dev/null`時点 | `/dev/null`      | 不変。つまり端末             |

ケース２：`>/dev/null 2>&1`

| 時系列           | 標準出力                | 標準エラー出力                      |
| :--------------- | :---------------------- | :---------------------------------- |
| 初期状態         | 端末                    | 端末                                |
| `>/dev/null`時点 | `/dev/null`             | 不変。つまり端末                    |
| `2>&1`時点       | 不変。つまり`/dev/null` | 標準出力をコピー。つまり`/dev/null` |

## バッククォートとシングルクォート

バッククォート： ``
→ 囲った中身をコマンドとして実行しその結果を出力する

シングルクォート： ''
→ 囲った中身を文字列として主力する

## Unix系のパーミッション

### パーミッションの見方

`ls -l`（ls: list segments, l:long の略）で表示される情報は下記のようになる。

```
-rw-r--r--  1 user_name  group   0  8 30 15:53 hoge.txt
```

-rw-r--r-- : ファイルの種類と許可属性  
1: ハードリンク数  
user_name: 所有者  
group: 所有グループ  
0: ファイルサイズ  
8 30 15:53: 最終更新日  

### ファイルの種類

| ls -lでの表示 | 意味                                                         |
| :------------ | :----------------------------------------------------------- |
| -             | 普通のファイル（Regular File）                               |
| b             | ブロックデバイスの[スペシャルファイル](https://ja.wikipedia.org/wiki/スペシャルファイル) |
| c             | キャラクターデバイスのスペシャルファイル                     |
| d             | ディレクトリ                                                 |
| l             | [シンボリックリンク](https://ja.wikipedia.org/wiki/シンボリックリンク) |
| p             | [名前付きパイプ](https://ja.wikipedia.org/wiki/名前付きパイプ) |
| s             | [UNIXドメインソケット](https://ja.wikipedia.org/wiki/UNIXドメインソケット) |

### 数字による権限の表記

| 記号 | 数字 | 意味         |
| :--- | :--- | :----------- |
| r    | 4    | 読み込み権限 |
| w    | 2    | 書き込み権限 |
| x    | 1    | 実行権限     |

rwxr-xr-x → 755

rwxrwxrwx → 777

### 参考

* [ファイルパーミッション - Wikipedia](https://ja.wikipedia.org/wiki/%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%83%BC%E3%83%9F%E3%83%83%E3%82%B7%E3%83%A7%E3%83%B3)
* [「ls -l」コマンドの表示からファイルの属性を理解しよう：“応用力”をつけるためのLinux再入門（9）（1/4 ページ） - ＠IT](https://www.atmarkit.co.jp/ait/articles/1605/18/news015.html)

## Github

* 違うブランチで作業してcommitした場合

`git checkout -b new_branch` をすればそこまでの履歴を持ったブランチが作成される

* revertについて

Revertはコミットを取り消すのではなく「対象コミットを打ち消すような修正コミットを新たに発行する」処理。
従って、打ち消した処理がある状態にしたいケースではrevertをrevertする必要がある。

（例）  
mainとA、Bブランチがある.  
Aにmainをmerge  
Bにmainをmerge  
BはAにPRを送っているので、一つ前でAをmergeしたかったことに気づく  
Bのmainのmergeをrevert  
BにAをmerge  
（このままだと「Bのmainのmergeをrevert」があることにより、mainでのcommitが打ち消されている）  
**「Bのmainのmergeをrevert」をrevertする必要がある**


* リモートの任意のブランチと同じ状態（HEADの位置・インデックス・ワーキングツリーを一致させた状態）にする

`git reset --hard origin/{develop}`

* リモートのタグを取得

`git pull --tags`

* 特定のタグにチェックアウトする

`git checkout refs/tags/{タグ名}`

* 追跡対象ファイルをインデックスから削除する

`git rm --cached {ファイル名}`

* Slackへの通知設定

`/github subscribe {owner}/{repository name} issues pulls commits releases reviews comments branches`

`/github settings` でスレッドへの通知機能をオフにできる
