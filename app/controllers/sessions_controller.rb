class SessionsController < ApplicationController
    def index
        @sessions = Session.all
    end

    def new
        @session = Session.new
    end

    def create
        @session = Session.new(session_params)
        # if @session.save
        #     redirect_to cms_articles_path, notice: "Article is successfully created."
        # else
        #     render "new"
        # end
    end
end
