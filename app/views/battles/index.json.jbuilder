json.array!(@battles) do |battle|
  json.extract! battle, :id, :name, :tag_one, :tag_two, :time_start, :time_end
  json.url battle_url(battle, format: :json)
end
