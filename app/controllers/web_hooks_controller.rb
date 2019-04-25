class WebHooksController < ApplicationController

  include WebHookConcern

  before_action :set_model, only: [:show, :update, :destroy]

  # GET /web_hooks
  def index
    @models = WebHook.all
    render json: @models
  end

  # GET /web_hooks/1
  def show
    if stale?(@post)
      render json: @model
    end
  end

  # POST /web_hooks
  def create
    @model = WebHook.new(model_params)

    if @model.save
      render json: @model, status: :created, location: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /web_hooks/1
  def update
    if @model.update(model_params)
      render json: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /web_hooks/1
  def destroy
    @model.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_hook
      @model = WebHook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def model_params
      params.require(:web_hook).permit(:url, :method, :model_type, :event_type, :auth_type, :auth_params, :default_params)
    end
end
