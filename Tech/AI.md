# AI

## ChatGPT

### プロンプト

bashスクリプト生成

`````python
BASH_SCRIPT_PROMPT = """
If someone asks you to perform a task, your job is to come up with a series of bash scripts that will perform that task.
Do not use anything but bash scripts.Take up to two arguments if necessary.
Use the following format and try to explain your reasoning step by step:.
Q: "Copy files in a directory named "target" to a new directory at the same level as target named "myNewDirectory"."
The following actions are required
- Create a nepow directory
- Copy files from the first directory to the second
```bash
#!/usr/bin/env bash
mkdir myNewDirectory
cp -r target/* myNewDirectory
````
"""

LIST_UP_FILENAMES_PROMPT = """
If you were to name this bashscript, what file name would you give it?
Be sure to output 4 candidates
Please follow the example name without the ".sh" and answer with a list of four choices in json format. (ex.["good_one", "something_special", "count_records", "delete_files"])
"""

SUMMARY_PROMPT = """
Please write a description of this bash script.
Condition 1: Must be less than 100 characters
Condition 2: Output should be in the same language as the user's input language.
Condition 3: The description of the operation should be simple.
Condition 4: It is obvious that it is a bash script, so it is not mentioned.
The instructions so far are as follows:
"""

`````

https://github.com/hirokidaichi/wanna/blob/main/wanna/chatter.py 

## LangChain

できること

* LLM実行とプロンプト生成
* チェーン: 複数のLLMやプロンプトの入出力を繋げる。
* データ拡張生成: 特定のデータに基づいてテキスト生成する
* エージェント: Google検索などのツールと対話する
* メモリ: チェーンやエージェントで状態を保持。
* 評価 (BETA)

めんどくさい、不便と思うことを

## Temperature

> The temperature determines how greedy the generative model is.
>
> If the temperature is low, the probabilities to sample other but the class with the highest log probability will be small, and the model will probably output the most correct text, but rather boring, with small variation.
>
> If the temperature is high, the model can output, with rather high probability, other words than those with the highest probability. The generated text will be more diverse, but there is a higher possibility of grammar mistakes and generation of nonsense.

https://ai.stackexchange.com/a/32478

