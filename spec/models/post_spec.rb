
require 'rails_helper'

RSpec.describe User, type: :model do
 context "データが正しく保存される" do
   it "team_idが保存されていれば成功" do
        team = FactoryBot.create(:team)
        @user = team.user.build(
          tame: "楽天イーグルス",
          team_id: 1,
      )
    end


        before do
            @user = User.new
            @user.name = "ユーザー名が保存されました"
            @user.image_id = "画像が保存されました。"
            @user.information ="自己紹介が保存されました"
            @user.team_id ="チーム情報が保存されました"
            @user.save
        end
        it "全て入力してあるので保存される" do
            expect(@user).to be_valid
        end
    end
end



require 'rails_helper'

RSpec.describe User, type: :model do
 context "データが正しく保存される" do
   it "team_idが保存されていれば成功" do
        team = FactoryBot.create(:team)
        @user = team.user.build(
          tame: "楽天イーグルス",
          team_id: 1,
      )
    end


        before do
            @user = User.new
            @user.name = "ユーザー名が保存されました"
            @user.image_id = "画像が保存されました。"
            @user.information ="自己紹介が保存されました"
            @user.team_id ="チーム情報が保存されました"
            @user.save
        end
        it "全て入力してあるので保存される" do
            expect(@user).to be_valid
        end
    end
end
