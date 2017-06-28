require 'nokogiri'
require 'open-uri'

class Restaurant < ActiveRecord::Base
    doc = Nokogiri::HTML(open("http://www.diningcode.com/pop_list.php"))
    doc.css('.dc-restaurant-name//a').each do |x|
            Restaurant.create(
                name: x.inner_text,
                )
    end
end