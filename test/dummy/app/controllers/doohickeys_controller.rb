class DoohickeysController < ApplicationController

  include WebHookHelper

  before_action :set_doohickey, only: [:show, :edit, :update, :destroy]

  add_web_hook(:show, :doohickey)

  # GET /doohickeys
  def index
    @doohickeys = Doohickey.all
    respond_to do |format|
      format.html { render :index }
    end
  end

  # GET /doohickeys/1
  def show
    respond_to do |format|
      format.html { render :show }
    end
  end

  # GET /doohickeys/new
  def new
    @doohickey = Doohickey.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  # GET /doohickeys/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
    end
  end

  # POST /doohickeys
  def create
    @doohickey = Doohickey.new(doohickey_params)
    respond_to do |format|
      if @doohickey.save
        format.html { redirect_to @doohickey, notice: 'Doohickey was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /doohickeys/1
  def update
    respond_to do |format|
      if @doohickey.update(doohickey_params)
        format.html { redirect_to @doohickey, notice: 'Doohickey was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /doohickeys/1
  def destroy
    @doohickey.destroy
    format.html { redirect_to doohickeys_url, notice: 'Doohickey was successfully destroyed.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doohickey
      @doohickey = Doohickey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doohickey_params
      params.require(:doohickey).permit(:title)
    end
end
