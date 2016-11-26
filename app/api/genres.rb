class Genres < Grape::API
  resources :genres do
    get '/' do
      { message: 'Should renders the genres list' }
    end
  end
end