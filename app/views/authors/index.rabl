collection @authors

@authors.map do |author|
  attribute :id, :name

  child :books do |book|
    attribute :id, :title
  end
end
