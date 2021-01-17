class PictureSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  set_type :image

  attributes :picture_url, :location, :source
end
