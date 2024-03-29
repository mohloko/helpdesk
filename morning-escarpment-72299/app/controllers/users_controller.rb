class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user	=	User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "Usuário cadastrado com sucesso!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit 
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil atualizado!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuário deletado!"
    redirect_to users_url
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  # Before filters
  
  # Confirma usuario correto
  def correct_user
    @user = User.find(params[:id])
    #redirect_to(root_url) unless @user == current_user
    redirect_to(root_url) unless current_user?(@user)
  end
  
  # Confirma usuario admin
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
end
