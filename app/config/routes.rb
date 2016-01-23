class SampleApp
  include Rack::R3

  get "/users" do
    UsersController.new.index
  end
end
