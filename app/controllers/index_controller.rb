class IndexController < ApplicationController

	protect_from_forgery :except => :create

	def index
		if session[:UserInfo]
			@index = Index.all.order("id DESC")
		else
			redirect_to user_path
		end
	end

	def create
		web_url = params[:web_url]
		surl    = [('a'..'z'), ('A'..'Z'), (0..9)].map { |i| i.to_a}.flatten.sample(5).join
		fb_id   = session[:UserInfo][:fb_id]
		image   = session[:UserInfo][:fb_image]
		@index = Index.new(
				:web_url => web_url, 
				:surl    => surl, 
				:fb_id   => fb_id,
				:image   => image
				)
		if @index.save
			redirect_to index_index_path
		else
			flash[:warning] = "error!"
		end
	end

	def destroy
		@index = Index.find(params[:id])
		@index.destroy

		redirect_to index_index_path
	end

	def turn_url
		@index = Index.where(:surl => params[:code]).first
		if @index
			redirect_to @index.web_url
		else
			redirect_to error404_path
		end
	end
end
