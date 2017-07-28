require 'sinatra'

get '/' do
    erb :get_username
end

post '/name' do
    name = params[:user_name]
    redirect '/password?user_name=' + name
end

get '/password' do
    name = params[:user_name]
    erb :get_password, :locals => {:name => name}
end

post '/password' do
    name = params[:user_name]
    password = params[:user_password]
    redirect '/names?user_name=' + name + '&user_password=' + password    
end

get '/names' do
    name = params[:user_name]
    password = params[:user_password]
    erb :get_names, :locals => {:name => name, :password => password}
end