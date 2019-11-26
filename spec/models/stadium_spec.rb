require 'rails_helper'

RSpec.describe Stadium, type: :model do
  context "データが正しく保存される" do
        before do
            @stadium = Stadium.new
            @stadium.name = "球場名が保存されました"
            @stadium.image_id = "球場画像が保存されました。"
            @stadium.information ="球場紹介情報が保存されました"
            @stadium.address ="球場の住所が保存されました"
            @stadium.latitude ="緯度が保存されました"
            @stadium.longitude ="経度が保存されました"
            @stadium.save
        end
        it "全て入力してあるので保存される" do
            expect(@stadium).to be_valid
        end
    end
end

