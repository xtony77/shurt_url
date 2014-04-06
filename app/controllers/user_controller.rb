class UserController < ApplicationController
	def index
		if session[:UserInfo]
			# redirect_to index_index_path
		end
	end
	
	def login
		auth_hash = request.env['omniauth.auth']
        if auth_hash
        	fb_id = auth_hash['uid']
        	fb_name = auth_hash['info']['name']
        	fb_email = auth_hash['info']['email']
        	fb_image = auth_hash['info']['image']

        	data_chk = User.where(:fb_id => fb_id).first
            
            if data_chk
            	data_chk.update_attributes(:fb_id => fb_id, :name => fb_name, :email => fb_email, :image => fb_image)
	        else
	        	 @user = User.new(
	            				:fb_id => fb_id,
	                            :name  => fb_name,
	                            :email => fb_email,
	                            :image => fb_image
	                        )
	            @user.save
	        end

            session[:UserInfo] = { :fb_id => fb_id, :fb_name => fb_name, :fb_email => fb_email, :fb_image => fb_image }
        else
            flash[:warning] = "FaceBook login failed!"
        end

        redirect_to root_path
	end

	def sign_out
        session.delete(:UserInfo)
        reset_session
        redirect_to root_path
	end
end
