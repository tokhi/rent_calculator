# frozen_string_literal: true

require 'test_helper'

class ApartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apartment = apartments(:one)
    @apartment = apartments(:two)
  end

  test 'should get index' do
    get apartments_url, as: :json
    assert_response :success
  end

  test 'should get index with filters param' do
    get apartments_url, params: { "apartment_size": '51', "zip_code": '13355' }, xhr: true
    json_response = JSON.parse(response.body)
    assert_response :success
    assert_equal 1, json_response.size
  end

  test 'should create apartment' do
    assert_difference('Apartment.count') do
      post apartments_url, params: { apartment: { rent: @apartment.rent, apartment_size: @apartment.apartment_size, apartment_type: @apartment.apartment_type, zip_code: @apartment.zip_code } }, as: :json
    end

    assert_response 201
  end

  test 'should show apartment' do
    get apartment_url(@apartment), as: :json
    assert_response :success
  end

  test 'should update apartment' do
    patch apartment_url(@apartment), params: { apartment: { rent: @apartment.rent, apartment_size: @apartment.apartment_size, apartment_type: @apartment.apartment_type, zip_code: @apartment.zip_code } }, as: :json
    assert_response 200
  end

  test 'should destroy apartment' do
    assert_difference('Apartment.count', -1) do
      delete apartment_url(@apartment), as: :json
    end

    assert_response 204
  end
end
