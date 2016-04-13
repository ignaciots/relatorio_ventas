require 'test_helper'

class SalesControllerTest < ActionController::TestCase
  setup do
    @sale = sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale" do
    assert_difference('Sale.count') do
      post :create, sale: { bill_sale_amount: @sale.bill_sale_amount, invoice_sale_amount: @sale.invoice_sale_amount, number_of_bills: @sale.number_of_bills, number_of_invoices: @sale.number_of_invoices, sales_date: @sale.sales_date, store_id: @sale.store_id }
    end

    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should show sale" do
    get :show, id: @sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale
    assert_response :success
  end

  test "should update sale" do
    patch :update, id: @sale, sale: { bill_sale_amount: @sale.bill_sale_amount, invoice_sale_amount: @sale.invoice_sale_amount, number_of_bills: @sale.number_of_bills, number_of_invoices: @sale.number_of_invoices, sales_date: @sale.sales_date, store_id: @sale.store_id }
    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete :destroy, id: @sale
    end

    assert_redirected_to sales_path
  end
end
