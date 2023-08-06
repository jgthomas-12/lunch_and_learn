class RecipeSerializerSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :url, :country, :image_url
end
