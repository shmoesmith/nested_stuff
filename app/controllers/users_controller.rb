class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.all.by_age
  end

  def show
  end

  def new
    @user = User.new
    @user.address = Address.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User created'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User updated'
    else 
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was destroyed'
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :age, :gender,
        address_attributes: [:street, :city, :state, :zip]
      )
    end

end