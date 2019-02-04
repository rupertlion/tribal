class SessionsController < ApplicationController
	def show
		@session = Session.find_by_id(params[:id])
	end
end
