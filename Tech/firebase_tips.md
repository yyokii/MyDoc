# Firestore

## アトミックオペレーション

* > Cloud Firestore は、データを読み書きするアトミック オペレーションをサポートしています。一連のアトミック オペレーションでは、すべてのオペレーションが正常に完了するか、またはどのオペレーションも適用されないかのいずれかです。Cloud Firestore には 2 種類のアトミック オペレーションがあります。
  >
  > - **トランザクション**: [トランザクション](https://firebase.google.com/docs/firestore/manage-data/transactions?hl=ja#transactions)は、1 つ以上のドキュメントに対して読み取り / 書き込みを行う一連のオペレーションです。
  > - **バッチ書き込み**: [バッチ書き込み](https://firebase.google.com/docs/firestore/manage-data/transactions?hl=ja#batched-writes)は、1 つ以上のドキュメントに対して書き込みを行う一連のオペレーションです。
  >
  > 1 回のトランザクションまたはバッチ書き込みでは、最大 500 のドキュメントに書き込みを行うことができます。

  [トランザクションとバッチ書き込み  |  Firebase](https://firebase.google.com/docs/firestore/manage-data/transactions)

## セキュリティ

>Reads in Cloud Firestore are performed at the document level. You either retrieve the full document, or you retrieve nothing. There is no way to retrieve a partial document. It is impossible using security rules alone to prevent users from reading specific fields within a document.

[特定のフィールドへのアクセスを制御する  |  Firebase](https://firebase.google.com/docs/firestore/security/rules-fields)

あるドキュメントの特定フィールドのみを対象とした読み取りはできない。

### セキュリティルールの構成に必要な要件を洗い出す際の例

|  パス名  | /databases/{database}/documents/users/{uid}                  |
| :------: | ------------------------------------------------------------ |
|  `read`  | 誰でも参照可能にする。                                       |
| `create` | Authenticationにより付与された自身の`uid`の値と一致するドキュメントのみ許可する。データが有するフィールドは名前及びプロフィールとし、これら以外は許可しない。 |
| `update` | Authenticationにより付与された自身の`uid`の値と一致するドキュメントのみ許可する。データが有するフィールドはプロフィールのみとし、これら以外は許可しない(名前の更新は許可しない)。 |
| `delete` | 削除は許可しない。                                           |

[Firebaseにおけるセキュリティの概要と実践 - Flatt Security Blog](https://flattsecurity.hatenablog.com/entry/2020/04/10/122834)

### Cloud Firestore Rules

#### [hasAll](https://firebase.google.com/docs/reference/rules/rules.List#hasAll)

`A.hasAll(B)`が`true`である時`A ⊇ B`

#### [hasAny](https://firebase.google.com/docs/reference/rules/rules.List#hasAny)

引数に渡された要素のいずれかが含まれているかどうかを判定する

```
['a','b'].toSet().hasAny(['c','d'].toSet()) == false
['a','b'].toSet().hasAny(['a','c'].toSet()) == true
```

#### [hasOnly](https://firebase.google.com/docs/reference/rules/rules.List#hasOnly)

引数に渡された要素のみで構成されているかを判定する

`A.hasOnly(B)`が`true`である時`A ⊆ B`

```
['a', 'b'].hasOnly(['a', 'c'])// false
['a', 'b'].hasOnly(['a', 'b', 'c'])// true
```

`A.hasAll(B) && A.hasOnly(B)`が`true`である時`A ⊇ B ∧ A ⊆ B`が`true`である、つまり、`A = B`である。

## リレーション

### 1:1

| 対応方針  | 内容                                           | 備考                                                         |
| --------- | ---------------------------------------------- | ------------------------------------------------------------ |
| Key       | ドキュメントフィールドに~IDを保持する          |                                                              |
| Reference | ドキュメントフィールドに対象へのパスを保持する | 例えばバージョン管理（v1, v2といった情報をパスに含める）により対象のデータのパス構造が変化する場合は、Refarenceの修正も必要になる。 |
| Same ID   | 対象と同じIDを保持する                         |                                                              |

### 1:N

| 対応方針       | 内容                                              | 備考                                              |
| -------------- | ------------------------------------------------- | ------------------------------------------------- |
| Query          | ドキュメントフィールドを検索してNの要素を取得する |                                                   |
| Sub Collection | SubCollectionを作成し要素をドキュメントを追加する | CollectionGroupを利用して親をまたいでの検索も可能 |

### N:N

| 対応方針              | 内容                                                         | 備考                                                         |
| --------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Junction Collection   | 紐づけ用のコレクションを別途作成する                         | いわゆるJunction Table手法のコレクションバージョン。         |
| Sub Collection        | Nの関係となる要素をサブコレクションで保持する。              | [How to model a many-to-many relationship in Firestore \|by Louis Coulet \|Firebase Tips & Tricks \|Mar, 2021 \|Medium](https://medium.com/firebase-tips-tricks/how-to-secure-many-to-many-relationships-in-firestore-d19f972fd4d3) |
| Duplicated Collection | 紐づけ用のコレクションを別途作成しそれを冗長化して互いのサブコレクションにもつ | セキュリティルールを各ドキュメントに設定する必要がある場合に有効。 |

### 参考

* [Cloud Firestoreを実践投入するにあたって考えたこと - Qiita](https://qiita.com/1amageek/items/d606dcee9fbcf21eeec6)
* [How to model a many-to-many relationship in Firestore \|by Louis Coulet \|Firebase Tips & Tricks \|Mar, 2021 \|Medium](https://medium.com/firebase-tips-tricks/how-to-secure-many-to-many-relationships-in-firestore-d19f972fd4d3)

## 検索

全文検索、部分検索は他のサービスを利用しないとできない
[全文検索  |  Firestore  |  Firebase](https://firebase.google.com/docs/firestore/solutions/search?hl=ja)
