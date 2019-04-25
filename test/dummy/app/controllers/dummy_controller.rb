class DummyController < ApplicationController

  skip_before_action :verify_authenticity_token

  # GET /dummy
  # POST /dummy
  # PUT /dummy
  # PATCH /dummy
  # DELETE /dummy
  def index
    #Does nothing really... (Except create log)

    render json: "success"
  end
end
