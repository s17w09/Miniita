## ■サービス概要
「Miniita（ミニータ）」は技術記事を書いたことがない、または書きたいけど書けないというプログラミング初心者向けに、技術記事を投稿しやすい環境を提供するアプリです。QiitaやZennで将来的に技術記事が書けるようになるために、Miniitaでは「①書くことへの抵抗感を下げる ②見られることへの抵抗感を下げる」機会をユーザーに提供します。

## ■ このサービスへの思い・作りたい理由
私自身、技術記事を書きたくてQiitaで書いていましたが、結局書き切れずに断念してしまった経験からこのサービスを発案しました。また、RUNTEQ内でも、自分のNotionに書き溜めている人は多いですが、外部に公開している人は少ないと感じました。外部にアウトプットしやすい技術記事サービスを作ることで、学習の定着度が上がると考え、開発を決意しました。

## ■ ユーザー層について
- プログラミング初心者で、書き方や内容に不安がある人
- 他人に見られることに抵抗感がある人


## ■サービスの利用イメージ
#### テンプレート織り込み済みの、記事投稿ページ
書くハードルを下げるポイントの1つ目です。  
技術記事を書いたことがないユーザーにとって、「どのように書けばいいのか」という問題が立ちはだかります。  
Miniitaでは複数のテンプレートを事前に用意し、テンプレートに沿って記事を書くことができます。テンプレートはChatGPT4に作成してもらったものです。現時点でのテンプレートお題は以下の通りです。  

現時点でのテンプレートお題は、下記を考えております。
- エラーを解決した手順
- 新しい技術で学んだこと
- Webアプリを開発した工程
- 様々なtips
各テンプレートに対し、3-5項目の目次を作成し、技術記事を書きやすい状態をセッティングします。

#### Miniita Botによる内容確認サポート機能
書くハードルを下げるポイントの2つ目です。  
技術記事を書いている途中で、内容に誤りがないか不安になる場面があります。その際、すぐにChatGPTに質問できるようMiniita Botを設置し、内容確認や誤字脱字の検閲を行います。

#### 通知機能
書くハードルを下げるポイント3つ目です。  
記事を書き始めてから書き終えるまで、ユーザーが離脱しない可能性は低いと考えています。
そのため、記事を保存してから3日経っても更新されない場合には、メールにて未完成記事があることを通知いたします。

#### いいねボタン
見られるハードルを下げるポイントになります。
類似サービスではいいねボタンは一種類ですが、Miniitaでは５種類程用意し、どの点が他のユーザーに参考になったのかが一目見てわかる仕様にします。
現時点では、以下のボタンを作成予定になります。
- 参考になった
- 新しい視点
- 応用したい
- 迅速な解決
- 読みやすい
- その他

## ■ ユーザーの獲得について
#### Xシェア機能から
ユーザーがXシェアできる機会を複数回提供し、X利用者の目に留まりやすくします。具体的には以下の箇所にXシェア機能を搭載します。
- ユーザーが技術記事を投稿した際に、その投稿内容をシェアする
- ユーザーが記事を投稿した際、バッチを付与する機能を搭載し、そのバッチを獲得した際にシェアします
  
#### Qiitaへの開発記事投稿から
以下の内容をQiitaに投稿することで、ユーザーを確保できると考えています。
- 技術記事を書くのを断念してしまった私自身が、Miniitaで技術記事を書く練習をした結果、Qiitaにも堂々と投稿できるようになった話
- Miniitaの開発秘話

## ■ サービスの差別化ポイント・推しポイント
【比較したサービス①】： 技術記事に特化した投稿サイト  
[Qiita](https://qiita.com/) / [Zenn](https://zenn.dev/) / [DEV community](http://dev.to/)  
【差別化ポイント】
- 記事投稿時にテンプレートが用意されている点。
-> Miniitaは「技術記事を書くことに抵抗がある人」向けのサービスなので、技術記事として投稿されやすいテンプレートを用意しています。
- 通知機能を搭載している点。
-> 「技術記事を投稿完了させる」ことを目的にしているため、投稿していない記事があればリマインドして記事を書き終えられるように支援します。

-> このアプリは、技術記事を書くハードルが低いため、このアプリを使用することでユーザーは技術記事の投稿を完了することができます。

【比較したサービス①】： 記事全般を投稿できるサイト  
[はてなブログ](https://blog.hatena.ne.jp/s0917w/s0917w.hatenablog.com/edit?utm_source=service_globalnav_pc&utm_medium=referral&utm_campaign=new_entry&_gl=1*1hph8f6*_gcl_au*MTQzMTEwOTEyNy4xNzE2NTM5NTY5*_ga*MTQzMDM3MDE1Ny4xNzE2NTM5NTY5*_ga_3WN9D6N5N5*MTcxNjUzOTU2OS4xLjEuMTcxNjUzOTYwMi4yNy4wLjA.) / [Medium](https://medium.com/) / [note](https://note.com/)

【差別化ポイント】
- いいね機能が複数用意されている点。
-> 具体的に、記事のどの部分に共感していいねボタンを押したのかが、いいねボタンの内容によってわかります。

-> このアプリは、技術記事を見られるハードルが低いため、このアプリを使用することでユーザーは「自分の記事のどの部分を評価してもらったのか」を理解し、次に技術記事を投稿する意欲を掻き立てられます。 


## ■ 機能候補
#### MVPリリース  
- [ ] 会員登録・ログイン機能
- Sorceryを使用して、ログイン機能を実装

- [ ] 記事投稿機能
- テンプレートをすぐ参照できるように配置
- OpenAIのAPIを使用して、Miniita Bot（AIによる内容確認サポート機能）を実装
- AmazonS3を使用して、文面とともに写真も投稿できるように実装
- 下書き保存機能の実装

- [ ] リマインド機能
- letter openerを使用した、定期メール配信機能の実装

- [ ] いいね機能
- ユーザー自身が投稿した記事に、いいねボタンを押せるよう実装
  
- [ ] Xシェア機能
- ユーザー自身が投稿した記事を、Xシェアできるよう実装

#### 本リリース  
- [ ] 記事を投稿完了した際に、バッチを付与する機能
- [ ] 自動保存機能
- [ ] プレビュー画面搭載
- [ ] Xシェア機能
- 付与されたバッチをXシェアできる機能

## ■ 機能の実装方針予定
| カテゴリー | 使用技術 |
:----|:----
| フロントエンド | Rails 7.1.3.2, TailwindCSS, DaisyUI  |
| バックエンド | Rails 7.1.3.2 (Ruby 3.2.2 )  |
| インフラ | Render.com / AmazonS3 |
| DB | PostgreSQL |
| 開発環境 | Docker |
| API | OpenAI API |

## ■ 画面遷移図
https://www.figma.com/design/fMNLgmhX0WqSTmgvktCdX7/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&t=t2RMkBAHQU4VD4Mv-1

## ■ ER図
[![Image from Gyazo](https://i.gyazo.com/2a48c6d179dfa091483ccb302032884a.png)](https://gyazo.com/2a48c6d179dfa091483ccb302032884a)
