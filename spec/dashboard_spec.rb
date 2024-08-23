require "spec_helper"
require "dashboard"

describe Dashboard do
  describe "#posts" do
    it "returns posts visible to the current user" do
      user = create(:user)
      other_user = create(:user)

      posts_visible_to_user = double("posts_visible_to_user")
      allow(Post).to receive(:visible_to).with(user).and_return(posts_visible_to_user)

      dashboard = Dashboard.new(posts: Post.all, user: user)

      expect(dashboard.posts).to eq(posts_visible_to_user)
    end
  end
end
