collection @books

@books.map do |book|
  attribute :id, :title

  child :authors do |author|
    attribute :id, :name
  end
end
