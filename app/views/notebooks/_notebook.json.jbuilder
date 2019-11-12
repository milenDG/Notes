json.extract! notebook, :id, :title, :subtitle, :description, :created_at, :updated_at
json.url notebook_url(notebook, format: :json)
