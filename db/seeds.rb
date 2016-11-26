# Genres
genres = ['fantasy', 'horror', 'crime', 'literary fiction', 'technical literature']
genres.each { |genre| Genre.create(genre: genre)}

# Authors
authors = [
    { name: 'J.R.R. Tolkien', biography: 'my best friend' },
    { name: 'Stephen King', biography: 'really good boy' },
    { name: 'Thomas Harris', biography: 'bad boy' },
    { name: 'Cormac McCarthy', biography: 'body' },
    { name: 'Thoughtbot', biography: 'love this boy' },
    { name: 'Harlow Ward', biography: 'he is awesome' },
    { name: 'Joe Ferris', biography: 'perfect man' }
]
authors.each do |author|
  Author.create(name: author[:name], biography: author[:biography] )
end

# Books
books = [
    { title: 'The Hobbit', brief: 'very good story', genre: 'fantasy', authors: ['J.R.R. Tolkien'] },
    { title: 'Lord of the Rings', brief: 'just love it', genre: 'fantasy', authors: ['J.R.R. Tolkien'] },
    { title: 'The Stand', brief: 'it is good', genre: 'horror', authors: ['Stephen King'] },
    { title: 'Red Dragon', brief: 'some brief', genre: 'crime', authors: ['Thomas Harris'] },
    { title: 'Blood Meridian', brief: 'some brief', genre: 'literary fiction', authors: ['Cormac McCarthy'] },
    { title: 'Ruby Science', brief: '...', genre: 'technical literature',
      authors: ['Thoughtbot', 'Harlow Ward', 'Joe Ferris']
    }
]

books.each do |book|
  Book.create(title: book[:title], brief: book[:brief], genre_id: Genre.where(genre: book[:genre]).first.id)
      .authors.push(Author.where(name: book[:authors].each { |author| author }).first)
end


