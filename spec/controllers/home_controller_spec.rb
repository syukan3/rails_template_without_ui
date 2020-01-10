require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  # Devise Authentication
  let(:user) { FactoryBot.create(:user) }
  before do
    # controller_macros.rb 内の login_user メソッドを呼び出し
    login_user user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
