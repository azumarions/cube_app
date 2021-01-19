# 概要
Ruber
* Ruberはルービックキューブのためのアプリケーションです。
* ※スマートフォン向けサイトです。

## アプリの目的
立体パズルの魅力を知り楽しんでもらいたい。
専門性・競技性を高めたい。

実はルービックキューブ,40年間で４億個以上が流通しているんです。
誰もが知っているルービックキューブ,しかし実際に揃えられる人・極める者は少なく感じます。

主に以下の機能を実装しました。
- ストップウォッチ機能
- 学習機能
- チャット機能

※ゲストログインができます。

# 使用技術・言語

- フロントエンド(HTML/CSS, javascript, jQuery, Bootstrap)
- バックエンド(Ruby on Rails6)
- テスト(RSpec, FactoryBot, Capybara)
- webサーバ(nginx, unicorn)
- データベース(MySQL)
- AWS(VPC, EC2, Route53, ALB, S3)
- 開発環境(MacOS, VScode, git, github, bash)

# インフラ構成
![overview image](https://github.com/azumarions/cube_app/blob/main/app/assets/images/cube_aws.png?raw=true)

# 機能

### ユーザー機能
- ログイン機能
- ユーザー登録・編集・削除
- ユーザー認証機能(devise)
- ユーザー検索機能(ransack)
- プロフィール画像・ステータスメッセージ機能
- ユーザー一覧機能
- フォロー機能(ajax)
- ゲストログイン機能

### ストップウォッチ機能
- 時間計測機能
- 時間記録機能
- 計測一覧機能
- ランキング機能
- 記録削除機能

### 学習機能
- 記事作成・編集・削除機能
- 記事一覧機能
- 記事検索機能(ransack)
- 記事詳細機能

### チャット機能
- 新規投稿機能
- 投稿一覧機能
- いいね機能(ajax)

### その他
- グローバルメニュー(Drawer.js)
- ページネーション(kaminari)
- レスポンシブ対応

# LETS TRY!

### TIMER
- メニューからタイマーを選択する。
- 時間を計測,記録してみよう！
- 計測記録のページが表示され今のタイムを見ることができます！
- メニューからランキングを選択する。
- 全ユーザーのタイムが早い順に表示されます。自分のタイムがあるか確認しよう！

### LEARN
- メニューから学習を選択する。
- 記事一覧から気になった記事を読むことができます。
- 作成するから自分で記事をつくることができます。
- 編集から自分の記事を編集・削除できます。

### CHAT
- グローバルメニューから投稿を選択する。
- メッセージを投稿してみよう！
- チャットページが表示され、投稿されたメッセージを見ることができます。
- 他のユーザーの投稿にいいねをしよう！
- 気になったユーザーのプロフィールを見てフォローする事もできます！(ユーザー名からプロフィールに移動します。)
