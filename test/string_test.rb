require 'test/unit'
require 'rubygems'
require 'mozier'

class StringTest < Test::Unit::TestCase
  def test_size_success
    assert_equal(28, "28 bytes".to_size)
    assert_equal(29184, "28.5 MB".to_size)
    assert_equal(10485760, "10 GB".to_size)
  end
  
  def test_size_failure
    assert_equal(nil, "foo".to_size)
    assert_equal(nil, "28 cents".to_size)
  end
end