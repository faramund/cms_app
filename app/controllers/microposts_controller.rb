class MicropostsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  def index
    @microposts = current_user.microposts
  end

  def show

  end

  # GET /microposts/new
  def new
    @micropost = current_user.microposts.new
  end

  # GET /microposts/1/edit
  def edit
  end

  # micropost /microposts
  # micropost /microposts.json
  def create
    @micropost = current_user.microposts.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: 'micropost was successfully created.' }
        format.json { render action: 'show', status: :created, location: @micropost }
      else
        format.html { render action: 'new' }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: 'micropost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to microposts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = current_user.microposts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:user_id, :content)
    end
end
