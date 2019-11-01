# frozen_string_literal: true

require 'test_helper'

class EstimationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    apartments(:one)
    apartments(:two)
    apartments(:two)
    @estimation = { "estimation": { "apartment_size": 51, "zip_code": '13355', "estimated_rent": 510.0 } }
  end

  test 'should get index' do
    get estimations_url, as: :json
    json_response = JSON.parse(response.body)
    assert_response :success
    assert_equal true, json_response['msg'].present?
  end

  test 'should get index with params' do
    get estimations_url, params: { "apartment_size": '51', "zip_code": '13355' }, xhr: true
    json_response = JSON.parse(response.body)
    assert_response :success
    assert_equal true, json_response['estimation']['estimated_rent'].present?
  end
end
