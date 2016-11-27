collection @book

attribute :id, :title, :brief, :cover

child :authors do |author|
  attribute :id, :name
end

node(:genre) { Genre.find(@book.genre_id).genre }
