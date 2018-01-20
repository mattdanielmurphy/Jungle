class EmailUsersController < ApplicationController
  before_action :set_email_user, only: [:show, :edit, :update, :destroy]

  # GET /email_users
  # GET /email_users.json
  def index
    @email_users = EmailUser.all
  end

  # GET /email_users/1
  # GET /email_users/1.json
  def show
  end

  # GET /email_users/new
  def new
    @email_user = EmailUser.new
  end

  # GET /email_users/1/edit
  def edit
  end

  # POST /email_users
  # POST /email_users.json
  def create
    @email_user = EmailUser.new(email_user_params)

    respond_to do |format|
      if @email_user.save
        format.html { redirect_to @email_user, notice: 'Email user was successfully created.' }
        format.json { render :show, status: :created, location: @email_user }
      else
        format.html { render :new }
        format.json { render json: @email_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_users/1
  # PATCH/PUT /email_users/1.json
  def update
    respond_to do |format|
      if @email_user.update(email_user_params)
        format.html { redirect_to @email_user, notice: 'Email user was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_user }
      else
        format.html { render :edit }
        format.json { render json: @email_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_users/1
  # DELETE /email_users/1.json
  def destroy
    @email_user.destroy
    respond_to do |format|
      format.html { redirect_to email_users_url, notice: 'Email user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_user
      @email_user = EmailUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_user_params
      params.require(:email_user).permit(:name, :email, :login)
    end
end
