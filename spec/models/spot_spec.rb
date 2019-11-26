require 'rails_helper'

RSpec.describe Spot, type: :model do
   context "データが正しく保存される" do
        before do
            @spot = Spot.new
            @spot.spot_number = "チームが保存されました"
            @spot.spot_content ="スポットの投稿内容が保存されました"
            @spot.spot_place ="スポットの金額が入力されました"
            @spot.spot_time ="スポットの時間が入力されました"
            @spot. plan_id ="プラン情報が保存されました"
            @spot. address ="スポット住所が保存されました"
            @spot.latitude ="緯度が保存されました"
            @spot.longitude ="経度が保存されました"
            @spot.spots_image_id ="スポット画像が保存されました"
            @spot.spot_title ="スポットのタイトルが入力されました"
            @spot.save
        end
        it "全てスポット情報が入力してあるので保存される" do
            expect(@spot).to be_valid
        end
    end
end

