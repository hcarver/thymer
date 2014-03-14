json.array!(@logs) do |log|
  json.extract! log, :id, :notes, :task_id, :time_minutes
  json.url log_url(log, format: :json)
end
