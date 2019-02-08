class MainController < ApplicationController
  layout "application"

  def index
    if user_signed_in?
      user = current_user
		end

		sessions = Session.all
		channel_name = Session.find_by(id: params[:sessionId]).channel_name if params[:sessionId]
    @main_props = {sessions: sessions, user: user, channel_name: channel_name}
  end
end
