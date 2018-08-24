class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    set_title("Merchants")
    erb :"merchants/index"
  end

  get '/merchants/:id' do |id|
    @merchant = Merchant.find(id)
    erb :"merchants/show"
  end

  get '/merchants/:id/edit' do |id|
    @merchant = Merchant.find(id)
    erb :"merchants/edit"
  end

  put '/merchants/:id' do
    id = params[:id]
    Merchant.update(id, params[:merchant])
    redirect "/merchants/#{id}"
  end

  delete '/merchants/:id' do |id|
    Merchant.delete(id)
    redirect "/merchants"
  end

  helpers do
    def set_title(t)
      @title = t
    end
  end
end
