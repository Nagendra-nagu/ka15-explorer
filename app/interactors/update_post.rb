class UpdatePost
    include Interactor
    delegate :post, :post_params, :current_user, to: :context
    def call
      begin
        old_status = post.status
        post.update(post_params)
        current_status = post.status
        if current_status != old_status && current_status == "published"
            post.published_at = Time.zone.now
            post.save
        end
        if current_status != old_status && current_status != "published"
            post.published_at = nil
            post.save
        end
        context[:post] = post
        context.message = "Operation succeeded"
      rescue => exception
        context.fail!(error: exception.message)
      end
    end
  end
  