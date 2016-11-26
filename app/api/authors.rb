class Authors < Grape::API
  resources :authors do
    get '/' do
      { message: 'Should renders the authors list' }
    end
  end
end