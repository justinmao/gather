require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      email: "testy@mctest.com",
      first_name: "Testy",
      last_name: "Jones",
      password: "ENCRYPTME",
      password_confirmation: "ENCRYPTME",
      )
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

  test "correctly formatted emails should be allowed" do
    valid_emails = %w[testy@mctest.com example@example.co.uk
      popper-locker.polka-dotter@country-fy.us]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email.inspect} should be valid"
    end
  end

  test "incorrectly formatted emails should not be allowed" do
    invalid_emails = %w[testy testymctest.com testy@mctest.
      example@example,co.uk example#example.co.uk e^ample@example.co.uk
      popper-locker@country_fy.us polka-dotter@country+fy.us]
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} should not be valid"
    end
  end

  test "emails should be unique" do
    @user.save
    duplicate = @user.dup
    duplicate.email = duplicate.email.upcase
    assert_not duplicate.valid?
  end

  test "emails should be saved in downcased form" do
    mixed_case_email = "teStY@MCtest.com"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end



end
