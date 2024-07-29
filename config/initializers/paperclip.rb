# Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'

# if Rails.env.production?
#   Paperclip::Attachment.default_options.merge!({
#     storage: :s3,
#     s3_credentials: {
#       bucket: ENV.fetch('AWS_S3_BUCKET_NAME'),
#       access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
#       secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
#       s3_region: ENV.fetch('AWS_REGION'),
#     },
#     s3_permissions: 'private',
#     s3_protocol: 'https'
#   })
# end