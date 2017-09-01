require 'nokogiri' 	#allows conversion of HTML to a NodeSet of Nokogiri::XML::Elements
require 'open-uri' 	#allows HTTP requests

#Loads the Scraper, President, and CLI classes
require_relative '../lib/presidents/scraper'
require_relative '../lib/presidents/president'
require_relative '../lib/presidents/cli'
