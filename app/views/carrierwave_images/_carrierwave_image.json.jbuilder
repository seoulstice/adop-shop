json.extract! carrierwave_image, :id, :created_at, :updated_at
json.url carrierwave_image_url(carrierwave_image, format: :json)
