require "test_helper"

class MetricNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metric_name = metric_names(:one)
  end

  test "should get index" do
    get metric_names_url, as: :json
    assert_response :success
  end

  test "should create metric_name" do
    assert_difference('MetricName.count') do
      post metric_names_url, params: { metric_name: { title: @metric_name.title } }, as: :json
    end

    assert_response 201
  end

  test "should show metric_name" do
    get metric_name_url(@metric_name), as: :json
    assert_response :success
  end

  test "should update metric_name" do
    patch metric_name_url(@metric_name), params: { metric_name: { title: @metric_name.title } }, as: :json
    assert_response 200
  end

  test "should destroy metric_name" do
    assert_difference('MetricName.count', -1) do
      delete metric_name_url(@metric_name), as: :json
    end

    assert_response 204
  end
end
