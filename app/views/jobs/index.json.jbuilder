json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :category, :city, :description, :perks, :how_to_apply, :company_name, :url, :is_featured
  json.url job_url(job, format: :json)
end
