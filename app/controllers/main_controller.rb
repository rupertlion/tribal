class MainController < ApplicationController
  layout "application"

  def index
    if user_signed_in?
      user = current_user
    end
    sessions = Session.all
    @main_props = {sessions: sessions,coach: session.users.coach,
									members:session.users.trainee, user: user}
  end
end
