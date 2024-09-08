## サービス名
# 「Miniita(ミニータ)」

サービスURL: [Miniita](https://www.miniita.com/)
[![Image from Gyazo](https://i.gyazo.com/f9acd6ce27eb2065aac3cfb78aee5c24.png)](https://gyazo.com/f9acd6ce27eb2065aac3cfb78aee5c24)

## ■サービス概要
「Miniita（ミニータ）」は技術記事を書いたことがない / 投稿したいけどハードルが高く投稿できないという方向けに、技術記事を投稿しやすい環境を提供するアプリです。QiitaやZennで将来的に技術記事が書けるようになるために、Miniitaでは「①書くことへの抵抗感を下げる ②見られることへの抵抗感を下げる ③継続して投稿を続けられる」機会をユーザーに提供します。

## ■ このサービスへの思い・作りたい理由
私自身、技術記事を投稿したくQiitaで執筆していましたが、投稿へのハードルの高さから断念してしまった経験がありこのサービスを発案しました。また初学者の方の多くが、自分のNotionに学習内容をまとめており外部へ公開している方は少ないと感じました。Miniitaのように外部にアウトプットしやすい技術記事アプリを作ることで、初学者でも気軽に投稿できると考え開発を決意しました。 

## ■ 機能一覧
| 投稿機能 | 下書き保存 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/0c654800484b6cff857e9575ac91a901.gif)](https://gyazo.com/0c654800484b6cff857e9575ac91a901) | [![Image from Gyazo](https://i.gyazo.com/4e437c2da57f2fef9f24e05d74d1993a.gif)](https://gyazo.com/4e437c2da57f2fef9f24e05d74d1993a) |
| 記事の投稿時、マークダウン記法で投稿でき、内容も即座にプレビュー画面で反映します。 | 記事を下書き保存できます。下書きに入れた記事は、マイページ上から再編集可能です。 |

| マークダウン使用法、MiniitaBot | 検索機能 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/68eba5d7981751432942741a2bd72f48.gif)](https://gyazo.com/68eba5d7981751432942741a2bd72f48) | [![Image from Gyazo](https://i.gyazo.com/037717ebb5472efcc73ff8ebd20af42e.gif)](https://gyazo.com/037717ebb5472efcc73ff8ebd20af42e) |
| マークダウン記法の使い方を確認できます。MiniitaBotでは、投稿中の不安な点をサポートします。 | 本文、タイトル、投稿者名で検索をかけることができます。 |

| ソート機能 | 複数のいいね機能 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/4c3a71bb6c7d29ccc648e07c2d72d5db.gif)](https://gyazo.com/4c3a71bb6c7d29ccc648e07c2d72d5db) | [![Image from Gyazo](https://i.gyazo.com/3d0530d6f5847a14ea8ff38effcbe72f.gif)](https://gyazo.com/3d0530d6f5847a14ea8ff38effcbe72f) |
| 新規順、古い順でソートをかけることが可能です。（デフォルトは新規順で表示） | 5つのいいねボタンを設置しており、其々の内容に合わせていいねボタンを選択できます。 |

| コメント機能（投稿・編集・削除） | コメントへのいいね機能 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/347345494e63c2976ca550f59e808b1a.gif)](https://gyazo.com/347345494e63c2976ca550f59e808b1a) | [![Image from Gyazo](https://i.gyazo.com/55cf230876aba80ad9f1b6d6a59b7e0b.gif)](https://gyazo.com/55cf230876aba80ad9f1b6d6a59b7e0b) |
| 記事に対するコメントを投稿できます。投稿・編集・削除すべて非同期処理で実装しています。 | コメントへいいねを押すことができます。コメントへのいいねも非同期処理で実装しています。 |

| プロフィール編集 | 投稿済、下書き記事の閲覧 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/2c0e629e13188ceefd7ba5e37ed09c9b.gif)](https://gyazo.com/2c0e629e13188ceefd7ba5e37ed09c9b) | [![Image from Gyazo](https://i.gyazo.com/0698cfa63127d9ed6160f7c6a109501d.gif)](https://gyazo.com/0698cfa63127d9ed6160f7c6a109501d) |
| メールアドレス、名前を変更することができます。 | 自分の投稿した記事、下書きした記事を確認できます。ここから詳細・編集ページに飛ぶことができます。 |

| いいね済の記事の閲覧 | ユーザーバッジ画面 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/fa890247407c5cdf5034bde7cb1ff23e.gif)](https://gyazo.com/fa890247407c5cdf5034bde7cb1ff23e) | [![Image from Gyazo](https://i.gyazo.com/e1d10bfaaf82575fa66b72f1ae3c83e0.gif)](https://gyazo.com/e1d10bfaaf82575fa66b72f1ae3c83e0) |
| いいねした記事を一覧で確認できます。其々の記事詳細画面へ遷移することも可能です。 | 1,3,5,10,20,30記事投稿した段階で、ユーザーバッジが付与されます。（現在は0投稿のため、バッジは付与されていません） |

| 継続サポート画面 | 通知機能 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/d17d9e5818e91e94c8b60c9ae9a961f5.gif)](https://gyazo.com/d17d9e5818e91e94c8b60c9ae9a961f5) | [![Image from Gyazo](https://i.gyazo.com/43606bedd6acb3a9062e8e7638088db4.gif)](https://gyazo.com/43606bedd6acb3a9062e8e7638088db4) |
| 総いいね数、総文字数が表示されます。また5記事以上投稿すると、MiniitaBotから総評をもらうことができます。 | 記事へのいいね/記事へのコメント/コメントへのいいね/ユーザーバッジ付与時に通知が入ります。未読の場合は青いマークがつき、確認するとマークが消えます。 |


## ■ 技術スタック
| カテゴリー | 使用技術 |
:----|:----
| フロントエンド | Rails 7.1.3.4, JavaScript, TailwindCSS, DaisyUI |
| バックエンド | Rails 7.1.3.4 (Ruby 3.2.2 )  |
| インフラ | Render.com |
| DB | PostgreSQL |
| 開発環境 | Docker |
| API | OpenAI API |

## ■ 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/34c04c8da0b7ff0962f35b77788c4c46.png)](https://gyazo.com/34c04c8da0b7ff0962f35b77788c4c46)
[詳細URL](https://www.figma.com/design/fMNLgmhX0WqSTmgvktCdX7/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&t=t2RMkBAHQU4VD4Mv-1)

## ■ ER図
[![Image from Gyazo](https://i.gyazo.com/7bd85e65299881047e42a7ab8931c529.png)](https://gyazo.com/7bd85e65299881047e42a7ab8931c529)

## ■ このアプリに関する記事
- [【個人開発】Qiitaで投稿を断念してしまった私が、3ヶ月越しに「初学者向けの技術記事アプリ」を作成しました！💐](https://qiita.com/s17w09/items/0abf0be66cdd973425cc)
- [【卒業制作】MVPリリース時点での実装内容まとめ①（技術スタック/実装機能編）](https://zenn.dev/s17w09/articles/3741fdb9480487)
- [【卒業制作】MVPリリース時点での実装内容まとめ②（gem選定理由編）](https://zenn.dev/s17w09/articles/fc1ff4102ac220)
- [【卒業制作】本リリース時点での実装内容まとめ①（UI編）](https://zenn.dev/s17w09/articles/8ea5ed9c88b2c4)
- [【卒業制作】本リリース時点での実装内容まとめ②（実装機能/gem編）](https://zenn.dev/s17w09/articles/1ae1751d47a82c)