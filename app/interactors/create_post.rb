class CreatePost
  include Interactor
  delegate :post_params, :current_user, to: :context
  def call
    begin
      post = Post.new(post_params)
      post.user = current_user
      if post.status == "published"
        post.published_at = Time.zone.now
      end
      post.save
      context[:post] = post
      context.message = "Operation succeeded"
    rescue => exception
      byebug
      context.fail!(error: exception.message)
    end
  end
end
