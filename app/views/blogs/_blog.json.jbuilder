json.extract! blog, :id, :name, :owner_id, :url_slug, :created_at, :updated_at
json.url blog_url(blog, format: :json)