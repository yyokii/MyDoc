## [Charles](https://www.charlesproxy.com/latest-release/download.do)

そのままではトライアル版なので、ライセンスが必要

## [Creative Croud](https://helpx.adobe.com/jp/download-install/kb/creative-cloud-desktop-app-download.html)

## [Docker](https://docs.docker.com/docker-for-mac/apple-m1/)

## Github テンプレート設定

* '.zprofile' などにエイリアスを設定する

```
alias gb="git branch"
alias gco="git checkout" 
alias gcm="git commit"
alias gca="git commit --amend"
alias gdel="git branch --merged|egrep -v '\*|develop|release|master'|xargs git branch -d"
alias gd="git diff"
alias glo="git log --oneline"
alias gph="git push origin HEAD"
alias gs="git status"
alias gt="git tag"
```

* コミットテンプレート設定
  * `git config --global commit.template {テンプレート用のファイル}`

## [Home Brew](https://brew.sh/index_ja)

## [Insomnia](https://insomnia.rest/download/)

## [Iterm2](https://iterm2.com/)

`brew install --cask iterm2`

設定ファイルは下記にあります。
https://github.com/yyokii/MyDoc/tree/main/Settings

## [Jetbrains Toolbox](https://www.jetbrains.com/ja-jp/toolbox-app/download/#section=mac)

## PlantUML

### (Visual Studio Code) ローカル

```
$ brew install graphviz
$ brew install adoptopenjdk --cask
$ brew install plantuml
```

設定の「Plantuml: Render」でLocalを設定する

### (Visual Studio Code) Dockerを利用

Dockerイメージをローカルで起動  
`$ docker run -d -p 8080:8080 plantuml/plantuml-server:jetty`

VSCodeで設定  
<img width="500" alt="スクリーンショット 2021-08-26 19 09 23" src="https://user-images.githubusercontent.com/20992687/130945660-6442e1b7-8fd6-44c5-8011-73e1cde6cb31.png">

## [Visual Studio Code](https://code.visualstudio.com/Download)

## [XcodesApp](https://github.com/RobotsAndPencils/XcodesApp)

Xcodeのバージョン管理ツール

```
brew install --cask xcodes
```
