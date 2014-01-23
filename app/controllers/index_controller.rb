class IndexController < ApplicationController
	def index
		@index = Index.all
	end

	def create
		# [('a'..'z'), ('A'..'Z')].map { |i| i.to_a}.flatten.sample(5).join
		# @groups = current_user.groups.build(groups_params)
		# if @groups.save
		# 	current_user.join!(group)
		# 	redirect_to groups_path
		# else
		# 	render :new
		# end
	end
end
