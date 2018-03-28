require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )


require_relative('./models/pizza_order.rb')

# index
get '/pizza_orders/' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# new
# show a form for new pizza details
get '/pizza_orders/new' do
  erb(:new)
end

# show
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:show)
end

#create
# process the data from form for new pizza
post '/pizza_orders' do
  # p params['first_name']
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#delete
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete()
  redirect '/pizza_orders'
end

#update
post '/pizza_orders/:id/update' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.update()
  erb(:update)
end
