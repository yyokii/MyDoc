# ブラウザアプリケーション



## Node 



## Typescript

## type or interface

[Google TypeScript Style Guide: Interfaces vs Type Aliases](https://google.github.io/styleguide/tsguide.html#interfaces-vs-type-aliases)

 オブジェクトを表す場合は interface を利用する

### ショートハンドプロパティ

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

[オブジェクト初期化子 - JavaScript | MDN](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Object_initializer)