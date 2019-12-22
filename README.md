# Name
### スタジアムログ

# Overview
<img width="1435" alt="TOP画面" src="https://user-images.githubusercontent.com/53601291/70369209-1830dc00-18f9-11ea-8547-06d330a00aa4.png">


### スタジアムログとはプロ野球球場のレビューサイトです
・例えば球場によってバリエーションはとても豊かです

・主要都市の駅から近い場所にあったり駅から球場までの近さなどのアクセス面

・球場に出店しているお店や球場のご当地グルメ、選手プロデュース弁当、ご飯の美味しさや価格帯などの食事面

・球場から見る景色やホーム球場の応援などの雰囲気

・試合前試合後の球場周りの観光地

・チケットの購入のしやすさや球場の中の利便性

### スタジアムログでは以上5項目にして採点しレビューすることができます。
### またユーザーが投稿した内容の中に球場以外で過ごしたこと(飲食店　観光地　宿泊施設 滞在場所)をプランとして記録に残すこともでき試合前もしくは試合後に過ごしたお気に入りの場所を登録して他のユーザーが見ることができます。

# Functions list
・記事投稿機能
・ページネーション機能
・多投稿機能(cocoon)
・ランキング機能
・検索機能
・google map機能
・いいね機能
・フォロー機能

# Technology list
言語
HTML,CSS,JavaScript,Ruby,SQL

フレームワーク
・Ruby on Rails

インフラ
・AWS(EC2 RDS)

Railsライブラリ
・materialize-sass
・refile
・devise
・ransack
・geocoder
・cocoon

JSライブラリ
・jquery-rails  

# Demo
### ユーザーが投稿した球場を評価したレビューはTOPページにて各項目に分かれ見れます.


<img width="1438" alt="ランキング一覧" src="https://user-images.githubusercontent.com/53601291/70369310-ace80980-18fa-11ea-96a2-0311e098eed5.png">
<img width="1427" alt="ランキングクリック" src="https://user-images.githubusercontent.com/53601291/70369315-b4a7ae00-18fa-11ea-9c2f-432d7b58c86e.png">


### 投稿の仕方は以下になります。
### まず球場を選択観戦した日にち、
### 5項目にジャンルを分けて5点満点で評価します。
### 次に投稿内容、投稿画像、お気に入りの場所を選択登録します。
### 投稿のみもできますが球場に行くまで記録をプランとして記録に残すことができます.


<img width="1436" alt="投稿画像スクリーンショット" src="https://user-images.githubusercontent.com/53601291/70369325-e7ea3d00-18fa-11ea-8c5e-96bd8b83965d.png">


### プランの作り方はまずタイトルを決めます。
### スポット場所は行った場所
### 金額はそのスポットで使用した金額
### 滞在時間はその場所で過ごした時間
### 画像とスポットでの感想を投稿することできます。


<img width="1418" alt="プラン選択画像" src="https://user-images.githubusercontent.com/53601291/70369327-ec165a80-18fa-11ea-88e3-75a2473085c6.png">


### 投稿後は以下の形でユーザーの投稿内容を見ることができます


<img width="1433" alt="投稿画面" src="https://user-images.githubusercontent.com/53601291/70369322-ddc83e80-18fa-11ea-8513-c33e893d3201.png">
<img width="794" alt="投稿後プラン画面" src="https://user-images.githubusercontent.com/53601291/70369346-326bb980-18fb-11ea-9caf-6273754282df.png">


### 球場一覧から球場を選択すると球場別にユーザーが投稿した一覧と全ユーザーがレビューした採点の平均点を見ることができます。


<img width="1438" alt="球場詳細画面" src="https://user-images.githubusercontent.com/53601291/70369351-41526c00-18fb-11ea-9f96-8c10f7d5e278.png">


# VS. 
SNSで個人単位でプロ野球球場をレビューしているサイトは
あるがまとめているサイトがなかったので個人的に知りたかった。
試合の内容や選手について投稿するユーザーは多いが
試合以外でファンが試合に行くまでにもしくは
試合後にどこに行っているのか知りたかった(観光　宿泊施設　飲み屋　観光など)
また普段行かない球場に遠征した時にユーザー投稿したプランを見ることで事前に下調べができると思ったから。




# Author
作成者　佐々木隆太
所属　DMMwebcamp9月生
email ryuta@gmail.com
