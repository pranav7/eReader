class ReaderController < ApplicationController

	def input_url
	end

	def reader
		@url = params[:input_url]
		source = open(@url).read
		readable = Readability::Document.new(source, 
			:tags => %w[div p img a], 
			:attributes => %w[src href], 
			:remove_empty_nodes => false)
		@title = readable.title
		@author = readable.author
		@image_url = readable.images
		@content = readable.content
	end

end