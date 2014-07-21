require 'sinatra/base'
require 'gschool_database_connection'
require_relative 'lib/visitor_comments'
require './lib/country_list'

class Application < Sinatra::Application

  def initialize
    super
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV'])
    @comments = CommentsTable.new(
      GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])
    )
  end

  get '/' do
    erb :index
  end

  post '/' do
    name = params[:name]
    message = params[:message]
    @messages = []
    # user_message = "#{name} said: '#{message}'."
    # @messages << user_message
    # @messages
    @comments.create(name, message)
    if @comments != nil
      all_comments = @comments.select_all
      @messages << all_comments.pop
    end
    p @messages
    redirect back
  end

  get '/continents' do
    all_continents = CountryList.new.continents
    erb :continents, locals: { continents: all_continents }
  end

  get '/continents/:continent_name' do
    list_of_countries = CountryList.new.countries_for_continent(params[:continent_name])
    erb :countries, locals: { countries: list_of_countries, continent: params[:continent_name] }
  end

end