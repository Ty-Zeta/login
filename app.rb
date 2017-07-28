require 'sinatra'
require_relative "calculator.rb"

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

post '/names' do
    name = params[:user_name]
    password = params[:user_password]
    fname = params[:first_name]
    lname = params[:last_name]
    redirect '/function?user_name=' + name + '&user_password=' + password + '&first_name=' + fname + '&last_name=' + lname
end

get '/function' do
    name = params[:user_name]
    password = params[:user_password]
    fname = params[:first_name]
    lname = params[:last_name]
    erb :get_calculator, :locals => {:name => name, :password => password, :fname => fname, :lname => lname}
end

post '/function' do
    name = params[:user_name]
    password = params[:user_password]
    fname = params[:first_name]
    lname = params[:last_name]
    calc = params[:calc]
    num1 = params[:num1]
    num2 = params[:num2]
    answer = params[:answer]
    answer = calculator(calc, num1, num2)
    redirect '/get_results?user_name=' + name + '&user_password=' + password + '&first_name=' + fname + '&last_name=' + lname + '&calc=' + calc + '&num1=' + num1 + '&num2=' + num2 + '&answer=' + answer
end

get '/get_results' do
    name = params[:user_name]
    password = params[:user_password]
    fname = params[:first_name]
    lname = params[:last_name]
    calc = params[:calc]
    num1 = params[:num1]
    num2 = params[:num2]
    answer = params[:answer]
    erb :get_results, :locals => {:name => name, :password => password, :fname => fname, :lname => lname, :calc => calc, :num1 => num1, :num2 => num2, :answer => answer}
end