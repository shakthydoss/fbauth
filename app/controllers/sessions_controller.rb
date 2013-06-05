class SessionsController < ApplicationController
  def new
  end

  def create
	auth_hash = request.env['omniauth.auth']

	if User.find_by_email(auth_hash['info']['email'])
		# user already exist
		render :text =>  "User already exist!@"
	else
	
	user = User.new();	
	user.name = auth_hash['info']['name']
	user.email = auth_hash['info']['email']
	user.first_name = auth_hash['info']['first_name']
	user.last_name = auth_hash['info']['last_name']
	user.location = auth_hash['info']['location']
	user.profile_img = auth_hash['info']['image']
	user.fbid = auth_hash['uid']
	user.fburl = auth_hash['info']['urls']['Facebook']
	user.description = auth_hash['extra']['raw_info']['about']
	user.gender = auth_hash['extra']['raw_info']['gender']
	user.locale = auth_hash['extra']['raw_info']['locale']
	user.timezone = auth_hash['extra']['raw_info']['timezone']

	# save user 
	# set cokkie 
	
	render :text => auth_hash['info']['name'] + "  " + auth_hash['info']['email']+ "  " + auth_hash['info']['first_name']+ " "+auth_hash['info']['urls']['Facebook'] + "  " +auth_hash['extra']['raw_info']['gender']+" "+auth_hash['uid']
	
	end 	
	
  end

  def failure
  end
end
