require './test/ex'
class IoControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get io_input_url
    assert_response :success
  end
  test 'should get view one' do
    get io_view_url, params: {'arr_len'=>'7', 'arr'=>'6 6 6 5 6 8128 7'}
    assert_response :success
    count = '2'
    max = [6, 6, 6]
    assert_select '#count', count
    assert_select '#max', max.to_s
  end
  test 'should get view three' do
    get io_view_url, params: {'arr_len'=>'4', 'arr'=>'28 6 8128 5 6 8128 7'}
    assert_response :success
    count = '1'
    max = [28, 6, 8128]
    assert_select '#count', count
    assert_select '#max', max.to_s
  end
end
