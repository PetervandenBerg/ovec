json.array!(@projects) do |project|
  json.extract! project, :title, :place, :description
  json.url project_url(project, format: :json)
end
