class SessionsController < ApplicationController

    def create
        @session = Session.new(session_params)
        @session.save
        if @session.persisted?
            redirect_to root_path
        else
            render json: {errors: 'Every field needs to be filled in!'}
        end
    end

    private

    def session_params
        params.require(:session).permit(:title, :start_date, :price_table_id)
    end
end
