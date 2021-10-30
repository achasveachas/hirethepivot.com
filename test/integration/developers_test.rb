require "test_helper"

class DevelopersTest < ActionDispatch::IntegrationTest
  test "can view developer profiles" do
    one = developers :one
    two = developers :two

    get root_path

    assert_select "h2", one.hero
    assert_select "h2", two.hero
  end

  test "successful profile creation" do
    sign_in users(:one)

    assert_difference "Developer.count", 1 do
      post developers_path, params: {
        developer: {
          name: "Developer",
          email: "dev@example.com",
          available_on: Date.yesterday,
          hero: "A developer",
          bio: "I develop."
        }
      }
    end
  end

  test "successful edit to profile" do
    sign_in users(:one)
    developer = developers(:one)

    get edit_developer_path(developer)
    assert_select "form"

    patch developer_path(developer), params: {
      developer: {
        name: "New Name"
      }
    }
    assert_redirected_to developer_path(developer)
    follow_redirect!

    developer.reload
    assert_equal "New Name", developer.name
  end

  test "invalid profile creation" do
    sign_in users(:one)

    assert_no_difference "Developer.count" do
      post developers_path, params: {
        developer: {
          name: "Developer"
        }
      }
    end
  end
end