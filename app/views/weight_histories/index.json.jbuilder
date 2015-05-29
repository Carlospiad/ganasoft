json.array!(@weight_histories) do |weight_history|
  json.extract! weight_history, :id, :weight, :animal_id, :date_of_weight
  json.url weight_history_url(weight_history, format: :json)
end
