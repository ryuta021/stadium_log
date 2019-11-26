require 'rails_helper'

RSpec.describe Post, type: :model do

   context "データが正しく保存される" do

        before do

           # describe "user_idが保存されていれば成功" do

                user = FactoryBot.create(:user)
                p user
                @post = user.post.build(
                  email: "test@test.com",
                  password: "000000",
                  name: "テスト太郎",
                  team_id: 1,
                  user_id: 1
                )
                p @post


           # end

            @post = Post.new
            @post.user_id = "ユーザー情報が保存されました"
            @post.stadium_id = "球場情報が保存されていれば成功"
            @post.watching_date = "観戦日が保存されました"
            @post.posted_image_id = "投稿画像が保存されました"
            @post.access_rate = "アクセス採点が保存されました"
            @post.gouremet_rate = "グルメ採点が保存されました"
            @post.sightseeing_rate = "観光採点が保存されました"
            @post.mood_rate = "ムード採点が保存されました"
            @post.capacity_rate = "観光採点が保存されました"
            @post.total_rate = "総合採点が保存されました"
            @post.latitude = "緯度が保存されました"
            @post.longitude = "経度が保存されました"
            @post.address = "投稿した住所が保存されました"
            @post.favorite_count = "いいねが保存されました"
            @post.post_content = "投稿内容が保存されました"
            @post.save
        end

        it "全て入力してあるので保存される" do
            expect(@post).to be_valid
        end
    end
end


