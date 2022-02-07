
%w(/ /stocks).each do |path|
    get path do
      @stocks = Stock.all
      erb :'stocks/index'
    end
  end