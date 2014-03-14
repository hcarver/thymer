json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :project_id, :slug, :estimated_minutes
  json.url task_url(task, format: :json)
end
