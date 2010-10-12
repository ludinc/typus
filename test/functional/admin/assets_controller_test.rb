require "test_helper"

class Admin::AssetsControllerTest < ActionController::TestCase

  setup do
    @request.session[:typus_user_id] = Factory(:typus_user).id
    @post = Factory(:post)
  end

  should_eventually "verify polymorphic relationship message" do
    get :new, { :back_to => "/admin/posts/#{@post.id}/edit",
                :resource => @post.class.name, :resource_id => @post.id }

    assert_select 'body div#flash' do
      assert_select 'p', "You're adding a new Asset to Post. Do you want to cancel it?"
      assert_select 'a', "Do you want to cancel it?"
    end
  end

  should_eventually "create a polymorphic relationship" do
    assert_difference('post_.assets.count') do
      post :create, { :back_to => "/admin/posts/edit/#{@post.id}",
                      :resource => @post.class.name,
                      :resource_id => @post.id }
    end

    assert_response :redirect
    assert_redirected_to '/admin/posts/edit/1#assets'
    assert_equal "Asset successfully assigned to Post.", flash[:notice]
  end

  should_eventually "render edit and verify message on polymorphic relationship" do
    asset = Factory(:asset)

    get :edit, { :id => asset.id,
                 :back_to => "/admin/posts/#{@post.id}/edit",
                 :resource => @post.class.name, :resource_id => @post.id }

    assert_select 'body div#flash' do
      assert_select 'p', "You're updating a Asset for Post. Do you want to cancel it?"
      assert_select 'a', "Do you want to cancel it?"
    end
  end

  should_eventually "return to back_to url" do
    asset = Factory(:asset)

=begin
Expected response to be a redirect to <http://test.host/admin/posts/1/edit> but
was a redirect to <http://test.host/admin/assets/edit/1?back_to=%2Fadmin%2Fposts%2F1%2Fedit>.
=end

    back_to = "/admin/posts/#{@post.id}/edit"

    post :update, { :id => asset.id,
                    :back_to => back_to,
                    :resource => @post.class.name,
                    :resource_id => @post.id }

    assert_response :redirect
    assert_redirected_to back_to
    assert_equal "Asset successfully updated.", flash[:notice]
  end

end
