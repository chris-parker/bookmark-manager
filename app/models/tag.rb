class Tag
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id, Serial
  property :name, Text, :lazy => false

  def self.create_tags(linktag, link, tags)
    tags.split(/\s*,\s*/).each do |tag|
      linktag.create(link: link, tag: Tag.create(name: tag) )
    end
  end

end
