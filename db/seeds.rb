genre = Genre.create(genre: 'Some kind of books')
book = Book.create(title: 'Some Title', brief: 'Some not really long brief', genre_id: genre.id )
book.authors.create(name: 'Alexander P', biography: 'Sexy boy')