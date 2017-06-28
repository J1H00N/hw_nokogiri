require 'open-uri'
require 'nokogiri'

class RestaurantsController < ApplicationController

def index
    @restaurants = Restaurant.all
end
end