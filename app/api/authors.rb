class Authors < Grape::API
  resources :authors do
    get '/', rabl: 'authors/index' do
      @authors = Author.all
    end

    get '/:id', rabl: 'authors/show' do
      @author = Author.find(params[:id])
    end
  end
end