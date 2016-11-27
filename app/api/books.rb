class Books < Grape::API
  resources :books do
    get '/', rabl: 'books/index' do
      @books = Book.all
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
  end
end