class MainController < ApplicationController
  layout "application"

  def index
    if user_signed_in?
      user = current_user
    end
    sessions = Session.all
    @main_props = {sessions: sessions, user: user, mysessions: user.sessions}
  end
end
