json.array!(@battles) do |battle|
  json.extract! battle, :id, :name, :time_start, :time_end
  json.url battle_url(battle, format: :json)
end
