class SessionsController < ApplicationController
	def create
		user = User.find_by_email(params[:email])
		# If user exists AND password entered is correct.
		if user && user.authenticate(params[:password])
			# Save user id in browser cookie.
			session[:user_id] = user.id
			flash[:notice] = "You have successfully logged in."
			redirect_to '/'
		else
			# If user/pass incorrect, send them back to the form.
			flash[:notice] = "Sorry, your credentials didn't check out. Care to try again?"
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have successfully logged out."
		redirect_to '/login'
	end
end
