json.array!(@lines) do |line|
  json.extract! line, :id, :name, :colour, :stripe
  json.url line_url(line, format: :json)
end
