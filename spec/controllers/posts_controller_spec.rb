require "rails_helper"

RSpec.describe PostsController do
  describe "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do
    before do
      u = User.create!(nickname: "foo")
      Post.create!(title: "title", content: "content", user: u)
    end

    it "returns http success" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end
  end
end
