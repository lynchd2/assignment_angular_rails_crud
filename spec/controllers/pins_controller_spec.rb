require 'rails_helper'

describe PinsController do
	describe "GET api/v1/pins.json" do
		let( :json ){ JSON.parse(response.body) }

		before do
			user = User.create(username: "Bob123")
			Pin.create(description: "I am a description", buy_sell: false, item_name: "Pin!", user_id: user.id)
			get :index, format: :json
		end

		it "should respond with a success" do
			expect( response.status ).to eq(200)
		end

		it "returns an array" do
			expect(json).to be_a Array
		end

		it "returns an array of one object" do
			expect(json.length).to eq(1)
		end

		it "returns the right keys" do
			expect(json[0].keys).to eq(["id", "item_name", "buy_sell", "description", "user_id", "created_at", "updated_at", "user"])
		end
	end
	
end