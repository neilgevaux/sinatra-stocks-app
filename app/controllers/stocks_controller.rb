
%w(/ /stocks).each do |path|
    get path do
      @stocks = Stock.all
      erb :'stocks/index'
    end
  end

%w(/new /stocks/new).each do |path|
    get path do
      @title = 'New Stock'
      @stock  = Stock.new
      erb :'stocks/new'
    end
  end

  # Create action
  post '/stocks' do
    if params[:stock]
      @stock = Stock.new(params[:stock])
      if @stock.save
        redirect '/stocks'
      else
        erb :'stocks/new'
      end
    else
      erb :'stocks/new'
    end
  end

  get '/stocks/:id' do
    @stock = Stock.find(params[:id])
    erb :'stocks/show'
  end

  helpers do
    def delete_stock_button(stock_id)
      erb :'stocks/_delete_stock_button', locals: { stock_id: stock_id }
    end
  end

  delete '/stocks/:id' do
    Stock.find(params[:id]).destroy
    redirect '/stocks'
  end

  # Update
  get '/stocks/:id/edit' do
    @stock = Stock.find(params[:id])
    erb :'stocks/edit'
  end

  # Update action
  put '/stocks/:id' do
  
    @stock = Stock.find(params[:id])
  
    if @stock.update(params[:stock])
      if @filename
  
        @stock.save
  
      end
      redirect "/stocks/#{@stock.id}"
    else
      erb :'stocks/edit'
    end
  end