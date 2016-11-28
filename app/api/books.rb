class Books < Grape::API
  resources :books do
    get '/', rabl: 'books/index' do
      params.each do |param, param_genre|
        if param == 'genre'
          genre_in_db = Genre.where(genre: param_genre).first
          genre_in_db && (@sorted_books = Book.where(genre_id: genre_in_db.id))
        end
      end

      @sorted_books ? (@books = @sorted_books) : (@books = Book.all)
    end

    get '/:id', rabl: 'books/show' do
      @book = Book.find(params[:id])
    end

    post '/' do
      @book = Book.new params
      @book.save
      @book
    end

    put '/:id' do
      @book = Book.find(params[:id])
      @book.update(params)
    end

    delete '/:id' do
      @book = Book.find(params[:id])
      @book.destroy
      'was destoyed'
    end
  end
end