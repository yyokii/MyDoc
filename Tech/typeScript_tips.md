## type or interface

[Google TypeScript Style Guide: Interfaces vs Type Aliases](https://google.github.io/styleguide/tsguide.html#interfaces-vs-type-aliases)

 オブジェクトを表す場合は interface を利用する

Modelを定義する際の個人的な使い分け

- `type`: エイリアスとして使用でき、既存の型を再利用するために使われます。複数の型を`&`で組み合わせることで複雑な型を作ることも可能。また、Union型(`|`)やTuple型など、より高度な型表現が可能。
- `interface`: オブジェクトの形状を定義します。他のインターフェースとマージすることが可能で、拡張性が高い。また、実装クラスが定義すべき契約を形式化するのに役立つ。
- `class`: クラスは実装（つまり、状態と動作）を含むことができる。また、継承とポリモーフィズムをサポートし、複数のインスタンスを生成できます。メソッドやゲッター/セッターを持つことができる。

Modelの型定義をする場合、その選択は主にユースケースに依存するが、

- モデルがデータの形状を示すだけであり、拡張性が重要な場合には`interface`を使う
- モデルがより複雑な型を必要としたり、型の操作（マッピングなど）を必要とする場合は`type`を使う。
- モデルが特定の動作やメソッド（例えば、バリデーション）を必要とし、それがクラスのインスタンスによって状態を持つ場合には`class`を使う。

typeによるマッピングの例

```typescript
type UserRole = 'admin' | 'guest'; // ユーザーロールの型定義

type User = {
  id: string;
  name: string;
  role: UserRole; // ユーザーロールの型を利用
};

// ロールによる操作のマッピング
type UserOperations = {
  [K in UserRole]: string[]; // KはUserRoleの各値を取り、その値に対応する操作のリストをマップする
};

// それぞれのロールが許可されている操作
const operations: UserOperations = {
  admin: ['create', 'read', 'update', 'delete'],
  guest: ['read'],
};
```

## ショートハンドプロパティ

ショートハンドプロパティは、JavaScriptのES6（ECMAScript 2015）で導入された機能で、オブジェクトリテラルでプロパティのキー名とその値が同じ場合に、コードをより簡潔に書くことを可能にする。

オブジェクトへのキー名の追加と値の設定が行われるイメージ。

下記は、

```typescript
let prompt = "my value";
let payload = { prompt: prompt };
```

次のように表すことができ、

```typescript
let prompt = "my value";
let payload = { prompt };
```

両者とも`payload`オブジェクトは`{ prompt: "my value" }`となる。

[オブジェクト初期化子 - JavaScript | MDN](
