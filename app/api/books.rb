class Books < Grape::API
  resources :books do
    get '/' do
      { message: 'Should renders the books list' }
    end
  end
end