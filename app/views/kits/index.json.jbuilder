json.array! @kits do |kit|
  json.id kit.id
  json.article kit.article
  json.barcode kit.barcode
  json.year kit.year
  json.name kit.name
  json.scale do
    json.id kit.scale&.id
    json.name kit.scale&.name
  end
end
