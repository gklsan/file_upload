json.extract! uploader, :id, :title, :description, :created_at, :updated_at
json.url uploader_url(uploader, format: :json)
