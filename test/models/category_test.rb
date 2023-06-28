require 'test_helper'

class CateogoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "Sports") #instance variable in tests will be scrubbed as soon as the function completes,
                                                 # therefore instance variable has to be declared in each test
                                                 # but to comply DRY we use setup method 
    end 

    test "category should be valid" do # tests dont run on dev DB, rather they run on test DB
        assert @category.valid?
    end

    test "category name should be present" do
        @category.name = ""
        assert_not @category.valid?
    end

    test "category should be unique" do 
        @category.save
        @category2 = Category.new(name: "Sports")
        assert_not @category2.valid?
    end

    test "category name too long" do
        @category.name = "a"*26
        assert_not @category.valid?
    end

    test "category name too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end

end