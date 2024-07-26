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
      last_pos = Post.order(position: :asc).last&.position
      post.position = last_pos.to_i + 1
      post.save
      context[:post] = post
      context.message = "Operation succeeded"
    rescue => exception
      context.fail!(error: exception.message)
    end
  end
end
