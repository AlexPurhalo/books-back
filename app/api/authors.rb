class Authors < Grape::API
  resources :authors do
    get '/', rabl: 'authors/index' do
      @authors = Author.all
    end
  end
end