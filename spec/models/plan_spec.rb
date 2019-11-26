require 'rails_helper'

RSpec.describe Plan, type: :model do
  context "データが正しく保存される" do
        before do
            @plan = Plan.new
            @plan.title = "プランが保存されました"
            @plan.post_id = "投稿情報が保存されました"
            @plan.save
        end
        it "全て入力してあるので保存される" do
            expect(@plan).to be_valid
        end
    end
end

