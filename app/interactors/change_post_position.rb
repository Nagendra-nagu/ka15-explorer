class ChangePostPosition
    include Interactor
    delegate :post, :new_position, to: :context
    
    def call
        prev_post = Post.find_by(position: new_position)
        current_post_pos = post.position
        prev_post_pos = prev_post.position

        post.position = new_position
        post.save(validate: false)

        prev_post.position = current_post_pos
        prev_post.save(validate: false)
    end
end 