class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.order(:name)
  end

  def new; end

  def create
    if @user.save
      redirect_to edit_user_path(@user), notice: 'Пользователь добавлен'
    else
      render :new
    end
  end

  def edit; end

  def update
    resource_params = user_params
    resource_params.delete(:password) if resource_params[:password].blank?

    if @user.update(resource_params)
      redirect_to edit_user_path(@user), notice: 'Пользователь обновлён'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path, notice: 'Пользователь удалён'
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :permission)
  end
end
