class UsersController
  def index
    @users = User.all
    content = JSON.generate(@users)
    [200, {'content-type' => 'application/json; charset=utf-8'}, [content]]
  end
end
