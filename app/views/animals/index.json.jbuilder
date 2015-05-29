json.array!(@animals) do |animal|
  json.extract! animal, :id, :brand_identification, :breed, :branded, :date_of_birth, :date_of_purchase, :gender, :country_of_birth, :status
  json.url animal_url(animal, format: :json)
end
