require 'rails_helper'

describe "Visitor profiles" do
  
  include TestFactories

  before do
    @user = authenticated_user
  end

  describe "Not signed in" do
    it "shows profile" do
      visit user_path(@user)
      expect (current_path).to eq(user_path(@user))
  end

end
end