class Books < Grape::API
  resources :books do
    get '/', rabl: 'books/index' do
      @books = Book.all
      # collection @books
      # attributes :id, :title
      # child :authors do |author|
      #   attribute :name
      # end
    end
  end
end