class Books < Grape::API
  resources :books do
    get '/', rabl: 'books/index' do
      @books = Book.all
    end

    get '/:id', rabl: 'books/show' do
      @book = Book.find(params[:id])
    end
  end
end