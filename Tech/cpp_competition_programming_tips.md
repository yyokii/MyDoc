# C++ TIPS

## 思考

* とりあえずsortしてみる
* 逆からやってみる
* 「例えば」はあくまで例なので、それをすべてととらえない
* 値のバイト数足りてるか注意する

### パターン

* 全探索
* 貪欲砲
* 判定問題への置き換え→境界を見つける（二分探索） [B - 花束](https://atcoder.jp/contests/arc050/tasks/arc050_b)

### 見落としがちなところ

* 最小条件の確認、特に0（なにもないことを表す0）の条件の考慮漏れ
* 結果のパターンの想定（どんなパターンがあるか網羅すること）

## C++ について

### 値の範囲

| 種類名      | バイト | その他の名前 | 値の範囲                                                  | 備考             |
| :---------- | :----- | :----------- | :-------------------------------------------------------- | ---------------- |
| `int`       | 4      | `signed`     | -2,147,483,648 ～ 2,147,483,647                           | 大体 +/- 2*10^9  |
| `long long` | 8      | なし         | -9,223,372,036,854,775,808 から 9,223,372,036,854,775,807 | 大体 +/- 9*10^18 |
| `float`     | 4      | なし         | 3.4E +/- 38                                               |                  |
| `double`    | 8      | なし         | 1.7E +/- 308                                              |                  |

### 浮動小数点数の誤差

浮動小数点数の演算は一般に誤差を含む。

>Ｃ言語で扱える実数値は，２進数の有限小数で表された数値である．例えば次のようなものである．
>1.5(10) = 1.1(2)
>3.25(10) = 11.01(2)
>理論的には小数が無限に続く値でも，そのうちの有限個の桁数でその値を表すしかない． 例えば，0.1 を２進数の小数で表すと
>0.1(10) = 0.000110011001100110011...(2)
>と無限に続くが，コンピュータの内部では有限桁で丸められている． このような場合には，本当の値ではなく，近似値でしか表すことができない．

[浮動小数点数型と誤差](https://www.cc.kyoto-su.ac.jp/~yamada/programming/float.html)

### テンプレートとは

> テンプレートの目的は、プログラマが一度コードを書くだけで、そのコードが型の形式に準拠して広範囲の型に適用できるようにすることです。

[C++ プログラミングガイド　第 4 章 テンプレート](https://docs.oracle.com/cd/E19957-01/805-7887/6j7dsdheo/index.html)

### pair型

* `pair<string, int> p;`
* `p = make_pair("some string", 100);`

### sort

* 降順: `sort(n.begin(), n.end(), greater<int>());`
  * `greater<T>()` Tに任意の型を代入する

### 小数点以下の桁数指定出力

`cout<<fixed<<setprecision(7);`

### map

std::map の内部ではキーが昇順になるよう要素がソートされている

### ++x, x++

インクリメントが代入の前（++x）か後（x++）かの違い

### リファレンス

* `T &` のように 型名に `&` をつけて宣言
* `T`型へのリファレンスは`T`型のオブジェクトを参照する
* 宣言と同時に代入されなければなりません
* 元の変数の別名となる
* 参照変数には "`NULL`" を代入することはできない。参照変数は常に有効なメモリアドレスを指していなければならない
* リファレンスというのはポインターのシンタックスシュガー

### ポインタ

* `T *` のように 型名に `*` をつけて宣言
* `T`型へのポインターは`T`型のオブジェクトを参照する
* オブジェクトの操作時には `*` をつける

### イテレータ

* iterator（イテレータ）とは抽象化されたポインタのことで、コンテナ の要素を指し、移動、要素を参照・変更することが出来る

### char型をint型に変換

```c++
char c = '1';
int i = c - '0';
```

## よく使うもの

### テンプレート

```c++
#include <bits/stdc++.h>

using namespace std;

#define rep(i, n) for (int i = 0; i < (n); ++i)
#define all(obj) (obj).begin(), (obj).end()
#define bit(n) (1LL << (n))

typedef long long ll;

template<class T> inline bool chmax(T &a, const T &b) { if (a<b) { a=b; return 1; } return 0; }
template<class T> inline bool chmin(T &a, const T &b) { if (b<a) { a=b; return 1; } return 0; }

const long long INF = 1LL << 60;

int main() {
  cin.tie(0);
  ios::sync_with_stdio(false);
}
```

* [参考： C++初心者がC++を使って競技プログラミングするための備忘録のようなもの](https://gist.github.com/rigibun/7905920)
* [参考： 第６６章　インライン関数](http://www7b.biglobe.ne.jp/~robe/cpphtml/html01/cpp01066.html)

### 文字列内検索


```c++

string s = "hello";

if(s.find("r") != string::npos) {
  cout<<"rが含まれている"
}

```

### Mapの中身全て

```c++
auto begin = mp.begin(), end = mp.end();
for (auto iter = begin; iter != end; iter++) {
  // first: key, second: value
  cout << "key = " << iter->first << "\n";
  cout << "value = " << iter->second << "\n";
}
```

### vexctorの最大・最小値

```c++
  // イテレーター取得
  auto maxIt = max_element(x.begin(), x.end());
  auto minIt = min_element(y.begin(), y.end());
  
  // インデックス取得
  int maxIndex = distance(x.begin(), maxIt);
  int minIndex = distance(y.begin(), minIt);
  
```

### 小数点以下の特定桁数出力

```c++
cout << fixed << setprecision(2) << 3.141; // "3.14"
cout << fixed << setprecision(2) << 3.0; // "3.00"
```

### 最大公約数

```c++
unsigned euclidean_gcd(unsigned a, unsigned b) {
  if(a < b) return euclidean_gcd(b, a);
  unsigned r;
  while ((r=a%b)) {
    a = b;
    b = r;
  }
  return b;
}
```

### 最小公倍数

最小公倍数は最大公約数を用いて求めることができる。
A, B の最大公約数を G 、最小公倍数を L として、

G×L=A×B

が成り立つ。従って、

```
L = A / euclidean_gcd(A, B) * B
```

と求めることができる。`A * B` としないことでオーバーフローのリスクを一部ケアしている。

[AtCoder 版！マスター・オブ・整数 (素因数分解編)](https://qiita.com/drken/items/a14e9af0ca2d857dad23)

### 素数判定

```c++

bool is_prime(long long N) {
  if (N == 1) return false;
  for (long long i = 2; i * i <= N; ++i) {
      if (N % i == 0) return false;
  }
  return true;
}

```

[AtCoder 版！マスター・オブ・整数 (素因数分解編)](https://qiita.com/drken/items/a14e9af0ca2d857dad23)

### 素因数分解

```c++

vector<pair<long long, long long> > prime_factorize(long long N) {
  vector<pair<long long, long long> > res;
  for (long long a = 2; a * a <= N; ++a) {
      if (N % a != 0) continue;
      long long ex = 0; // 指数

      // 割れる限り割り続ける
      while (N % a == 0) {
          ++ex;
          N /= a;
      }

      // その結果を push
      res.push_back({a, ex});
  }

  // 最後に残った数について
  if (N != 1) res.push_back({N, 1});
  return res;
}

```

[AtCoder 版！マスター・オブ・整数 (素因数分解編)](https://qiita.com/drken/items/a14e9af0ca2d857dad23)

### 二分探索

`lower_bound` は以上、 `upper_bound` はより大きいものを探す

```c++
vector<int> vec = {1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7};

// 3を二分探索。 positionはイテレータであり、*positionで要素にアクセスできる（この場合、3）
auto position = lower_bound(vec.begin(), vec.end(), 3);
// インデックス
int idx_lower = distance(vec.begin(), position);
cout << "vec[" << idx_lower << "] = " << *position << "\n";
```

### しゃくとり法

適用できるパターン
* 区間 `[left, right)` が「条件」を満たすなら、それに含まれる区間も「条件」を満たす
* 区間 `[left, right)` が「条件」を満たすなら、それを含む区間も「条件」を満たす

問題のパターン
* 「条件」を満たす区間 (連続する部分列) のうち、最小の長さを求める
* 「条件」を満たす区間 (連続する部分列) のうち、最大の長さを求める
* 「条件」を満たす区間 (連続する部分列) を数え上げる

```c++
int right = 0;
long long sum = 0
for (int left = 0; left < n; ++left) {
    while (right < n && (right を 1 個進めたときに条件を満たす)) {
        /* 実際に right を 1 進める */
        // ex: sum += a[right];
        ++right;
    }

    /* break した状態で right は条件を満たす最大なので、何かする */
    // ex: res += (right - left);

    /* left をインクリメントする準備 */
    // ex: if (right == left) ++right;
    // ex: else sum -= a[left];
}

```

[しゃくとり法 (尺取り法) の解説と、それを用いる問題のまとめ](https://qiita.com/drken/items/ecd1a472d3a0e7db8dce)

### 累積和

```c++
int N; cin >> N; // 配列サイズ
vector<int> a(N);
for (int i = 0; i < N; ++i) cin >> a[i]; // a の入力

// 累積和
vector<int> s(N+1, 0); // s[0] = 0 になる
for (int i = 0; i < N; ++i) s[i+1] = s[i] + a[i];

// 区間 [left, right) の総和を求める
int left, right;
cin >> left >> right;
cout << s[right] - s[left] << endl;
```

[累積和を何も考えずに書けるようにする！](https://qiita.com/drken/items/56a6b68edef8fc605821)

### bit全探索

```c++
int n = 3;

// {0, 1, ..., n-1} の部分集合の全探索
for (int bit = 0; bit < (1<<n); ++bit) {
  for (int i = 0; i < n; ++i) {
    if (bit & (1<<i)) { // i が bit に入るかどうか
    	// 部分集合に含まれるもの。iは0~n-1の範囲の任意の値
    }
  }
}
```

[参考：ビット演算 (bit 演算) の使い方を総特集！ 〜 マスクビットから bit DP まで 〜](https://qiita.com/drken/items/7c6ff2aa4d8fce1c9361)

### （DP）最小化問題

`template` の `chmin` と `chmax`、 `INF` 定義を利用

```c++
// DP テーブル
long long dp[100010];

// DP テーブル全体を初期化 (最小化問題なので INF に初期化)
for (int i = 0; i < 100010; ++i) dp[i] = INF;

// 初期条件
dp[0] = 0;

// ループ
for (int i = 0; i < N; ++i) {
  chmin(dp[なにか], dp[なにか] + なにか);
  ...
}

// 解を得て出力
cout << dp[N-1] << endl;
```

## 苦手問題

### ABC

* [C - Unification](https://atcoder.jp/contests/abc120/tasks/abc120_c): 思いつかなかった

### ARC

* [C - 一次元リバーシ](https://atcoder.jp/contests/abc047/tasks/arc063_a): 操作の抽象化