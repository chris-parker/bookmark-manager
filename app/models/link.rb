class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, Text, :lazy => false
  property :href, Text, :lazy => false

end
