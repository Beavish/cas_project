require 'test_helper'

class ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get world" do
    get content_world_url
    assert_response :success
  end

  test "should get politics" do
    get content_politics_url
    assert_response :success
  end

  test "should get sport" do
    get content_sport_url
    assert_response :success
  end

  test "should get design" do
    get content_design_url
    assert_response :success
  end

  test "should get culture" do
    get content_culture_url
    assert_response :success
  end

  test "should get business" do
    get content_business_url
    assert_response :success
  end

  test "should get travel" do
    get content_travel_url
    assert_response :success
  end

  test "should get science" do
    get content_science_url
    assert_response :success
  end

  test "should get Opiniontechnology" do
    get content_Opiniontechnology_url
    assert_response :success
  end

  test "should get health" do
    get content_health_url
    assert_response :success
  end

end
