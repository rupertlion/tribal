class SessionsController < ApplicationController
    def index
        @sessions = Session.all
    end

    def new
        @session = Session.new
    end

    # def create
    #     @session = Session.create(session_params)
    #     if @session.save
    #         redirect_to sessions_path, notice: "Session is successfully created."
    #     else
    #         render "new"
    #     end
    # end
    
    def create
        @session = Session.create(session_params)
        if @session.persisted?
            redirect_to session_path(@session), notice: "Session is successfully created."
        else
            redirect_to "new", notice: 'Every field needs to be filled in!'
        end
    end

    # private
    # def session_params
    #     params.require(:session).permit()
    # end
end
