# OctopressでHiroshima.rbのサイトを更新しよう

ひむらともひこ(@eielh)

2012/06/02

////

## 発端

* `github` をつかおう。
* `github pages` つかいたいです。

////

というわけで

////

![](hiroshimarb.png)
http://hiroshimarb.github.com/

////

## 利用ツール

![](octopress.png)

http://octopress.org/

////

## 更新方法

http://hiroshimarb.github.com/docs/HowToUpdateWebSite/

////

### 現状の構成とかルール

////

* `docs/`  RubyとかRailsとかのメモ

////

### リポジトリ取得

////

$ git clone git@github.com:hiroshimarb/hiroshimarb.github.com.git

////

### ページの作成

////

$ rake "new_page[ページ名]"

$ editor source/ページ名/index.md

////

ページ名は日本語を使わないほうがよさそうです。

////

### ブログ記事の作成

////

ぺージとの違いはRSSが生成されたりとか。

////

$ rake "new_post[記事名]"

$ editor sources/_posts/日付l-記事名.md

////

記事やページは先頭にページの情報がついた markdown 形式になります。

////

### プレビュー

////

$ rake preview

////

### 公開

////

公開先の設定

////

$ rake 'setup_github_pages[git@github.com:hiroshimarb/hiroshimarb.github.com.git]'

(一度だけ必要)


////

公開

////

$ rake gen_deploy

////

### 変更を保存

commit & push

////

やっておかないと、他の人が gen deployしたときに消えてしまいます。

////

    $ git add .
    $ git commit -m "message…"
    $ git push

////

## とりあえずやってみよう

* 案1 メンバーページでもつくってみる
* 案2 ……(その場で考える

////

## 何すればいいの

* ruby のメモでもかこう
* git のメモでもかこう
* 告知をかこう
* 誤字脱字を直そう
* 内容を読んで確認しよう
* 課題を上げてみよう

////

git が使えなくてもいろいろできる。

ファイルの編集とか。

ついでに徐々に git を覚えよう。

////

# ついでに Github page について

http://help.github.com/pages/

githubのサイトでマウスでポチポチおすだけ

この場合はJekyllを使うことになる

////

## Jekyll

http://jekyllrb.com/

static なブログツール

サーバにプログラムをおかなくてもつかえる

記事をローカルで書いてpushするとhtmlが生成

////

## Octopress

static なブログツール

Jekyllが処理できるファイルを生成

その後、Jekyllを使ってhtml作成

////

とにかく

自分のリポジトリで遊んでみよう

////

おわり
