class RentPolicy
  attr_reader :user, :rent

  def initialize(user, rent)
    @user = user
    @rent = rent
  end

  def index?
    rent_of_user?
  end

  def create?
    rent_of_user?
  end

  def rent_of_user?
    @user.id == @rent.user_id
  end
end
