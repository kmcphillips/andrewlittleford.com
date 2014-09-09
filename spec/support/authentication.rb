def login_as_mock_user
  user = FactoryGirl.create(:user)
  allow(controller).to receive(:current_user).and_return(user)
  user
end
