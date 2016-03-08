require 'test_helper'

class OffenseTest < ActiveSupport::TestCase

  setup do
    @offense=Offense.new
  end

  test 'should allow blank emails' do
    @offense.email = ''
    assert_equal @offense.valid?, true
  end

  test 'should fail on invalid email addresses' do
    addresses = %w[asdf1231 blargh@com.com@.com test_at_example_dot_com test@example,com test@test+test.com]
    addresses.each do |invalid_address|
      @offense.email = invalid_address
      assert_equal @offense.valid?, false, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'should allow valid addresses' do
    addresses = %w[patrick.o'brien@example.ie test@example.com george@a.cz what@what.com]
    addresses.each do |valid_address|
      @offense.email = valid_address
      assert_equal @offense.valid?, true, "#{valid_address.inspect} should be valid"
    end
  end

end
