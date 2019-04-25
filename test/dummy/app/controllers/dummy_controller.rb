class DummyController < ApplicationController

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
