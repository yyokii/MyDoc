* Xcodeのバージョン情報などの一覧:  https://xcodereleases.com/
* SSH接続でパスワードを付与して接続

```
sshpass -p alpine ssh root@127.0.0.1 -p2222
```

* SCPでファイル取得

```
scp -P 2222 root@127.0.0.1:/file.txt local.txt
```

* Assets.car内のリソース名を確認する

```
assetutil -I Assets.car | grep RenditionName | cut -f2 -d ':'
```

* fsmon
* Burp Suit
* Frida, 起動しているアプリ情報

```
frida-ps -Ua
```

* Frida, 写真アプリでsqliteを使用しているかのログが出るはずだが、でない。

```
frida-trace -U -i open * -I * sqlite * -f com.apple.mobileslideshow
```

*

## References

* https://www.nowsecure.com/blog/2021/09/08/basics-of-reverse-engineering-ios-mobile-apps/

