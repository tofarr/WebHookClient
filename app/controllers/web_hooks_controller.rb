class WebHooksController < ApplicationController
  before_action :set_web_hook, only: [:show, :update, :destroy]

  # GET /web_hooks
  def index
    @web_hooks = WebHook.all

    render json: @web_hooks
  end

  # GET /web_hooks/1
  def show
    render json: @web_hook
  end

  # POST /web_hooks
  def create
    @web_hook = WebHook.new(web_hook_params)

    if @web_hook.save
      render json: @web_hook, status: :created, location: @web_hook
    else
      render json: @web_hook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /web_hooks/1
  def update
    if @web_hook.update(web_hook_params)
      render json: @web_hook
    else
      render json: @web_hook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /web_hooks/1
  def destroy
    @web_hook.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_hook
      @web_hook = WebHook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def web_hook_params
      params.require(:web_hook).permit(:url, :method, :model_type, :event_type, :auth_type, :auth_params, :default_params)
    end
end
