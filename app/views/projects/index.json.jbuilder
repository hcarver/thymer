json.array!(@projects) do |project|
  json.extract! project, :id, :name, :client_id, :slug
  json.url project_url(project, format: :json)
end
