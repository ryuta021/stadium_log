require 'rails_helper'

RSpec.describe Team, type: :model do
   context "データが正しく保存される" do
        before do
            @team = Team.new
            @team.team = "チームが保存されました"
            @team.save
        end
        it "全て入力してあるので保存される" do
            expect(@team).to be_valid
        end
    end
end






