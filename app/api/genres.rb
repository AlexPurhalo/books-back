class Genres < Grape::API
  resources :genres do
    get '/' do
      @genres = Genre.all
    end
  end
end