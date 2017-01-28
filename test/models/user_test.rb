require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      email: "testy@mctest.com",
      first_name: "Testy",
      last_name: "Jones",
      password: "ENCRYPTME",
      salt: "PEPPER")
  end

  test "unmodified user should be valid" do
    assert @user.valid?
  end

  test "email should not be blank" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "x" * 245 + "@mctest.com"
    assert_not @user.valid?
  end

end
