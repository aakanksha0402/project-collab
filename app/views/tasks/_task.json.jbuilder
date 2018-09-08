json.extract! task, :id, :status, :name, :description, :created_at, :updated_at
json.url task_url(task, format: :json)
