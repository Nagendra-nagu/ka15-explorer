class UpdatePost
    include Interactor
    delegate :post, :post_params, :current_user, to: :context
    def call
      begin
        old_status = post.status
        new_position = post_params["position"]
        post_params.delete("position")
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
        ChangePostPosition.call(post: post, new_position: new_position)
        context[:post] = post
        context.message = "Operation succeeded"
      rescue => exception
        context.fail!(error: exception.message)
      end
    end
  end
  