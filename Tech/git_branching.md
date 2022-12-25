## Git flow

| 利用ブランチ     | 利用目的                             | 作成元  | マージ先      | 備考 |
| ---------------- | ------------------------------------ | ------- | ------------- | ---- |
| main             | ベースブランチ、リリース済みコード用 | -       | -             |      |
| hotfix           | 重大なバグ対応                       | main    | main, develop |      |
| release branches | リリースバージョン調整               | develop | main, develop |      |
| develop          | 開発元になるブランチ                 | main    | release       |      |
| feature branches | 機能開発                             | develop | develop       |      |

課題

* hotfixやreleaseブランチは複数のマージ先を持つのでそのし忘れが懸念される

## GitHub Flow

mainブランチを更新しデプロイ頻度を高めることで未リリースコードを最小限に抑える

| 利用ブランチ         | 利用目的               | 作成元 | マージ先    | 備考 |
| -------------------- | ---------------------- | ------ | ----------- | ---- |
| main                 | ベースブランチ         | -      | -           |      |
| work branches        | 機能開発               | main   | integration |      |
| integration branches | リリースバージョン調整 | work   | main        |      |

課題

* 複数の環境にデプロイしたい場合は別の方法を検討する必要がある

## GitLab Flow

機能ブランチをマージするたびに本番環境にデプロイできることを前提とする。
（下記の利用目的に記載の「環境」についてはあくまで例です）

| 利用ブランチ   | 利用目的           | 作成元 | マージ先       | 備考 |
| -------------- | ------------------ | ------ | -------------- | ---- |
| main           | ステージング環境用 | -      | pre-production |      |
| feature/hotfix | 機能開発           | main   | main           |      |
| pre-production | リリース前テスト   | -      | production     |      |
| production     | リリース済み       | -      | -              |      |

## 参考

* https://nvie.com/posts/a-successful-git-branching-model/
* https://docs.gitlab.com/ee/topics/gitlab_flow.html

