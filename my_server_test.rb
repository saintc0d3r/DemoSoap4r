require "./my_server"
require "./test_helper"
require "soap/rpc/driver"

class MyServerTest < Test::Unit::TestCase
  # A test for add method.
  def test_add
    #Arrange
    driver = SOAP::RPC::Driver.new("http://localhost:9999","urn:ruby:calculation")
    driver.add_method('add', 'a', 'b')
    expected = 10

    #Act & Assert
    actual = driver.add(5,5)
    assert_equal(expected, actual)
  end

  def test_div
    #Arrange
    driver = SOAP::RPC::Driver.new("http://localhost:9999","urn:ruby:calculation")
    driver.add_method('div','a','b')
    expected = 2

    #Act & Assert
    actual = driver.div(4,2)
    assert_equal(expected, actual)
  end
end