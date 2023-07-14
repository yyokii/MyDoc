
## 標準入力

文字列の読み込み
```.swift
let input = readLine()!
```

文字列で読み込んだものを一文字ずつの配列にする
```.swift
let inputArray = Array(input)
```

スペースで区切られたIntの配列を読み込み
```.swift
let inputNumbers = readLine()!.split(separator: " ").map { Int(String($0))! }
```
