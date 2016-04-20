class UsersController < ApplicationController	

  before_action :login_required, except: [ :index, :show ]
  before_action :role_required, only: [ :destroy, :update, :index, :show ]

  before_action :owner_required, only: [ :edit, :update, :destroy]
	
	def edit
		render :edit   
  end
	
	def destroy
    #action d'effacement de l'utilisateur
    @user.destroy
    flash[:notice] ="L'utilisateur a été effacé."
    redirect_to action: "index"
  end
	
	def update
	  if @user.update(compte_params)  
      flash[:notice] ="L'utilisateur a été mis à jour."
      redirect_to action: "index"
    else
      flash[:alert] ="L'utilisateur n'a pas été mis à jour."
      redirect_to action: "index"
    end
  end
	
  def index
    @users = User.all.drop(1)
    @roles = Role.all.drop(1)
    render :index
  end

  def show
    if exists
      render :show
    else 
      redirect_to action: "index"
    end

  end

  private

  def compte_params
    params.permit(:role_id)
  end

  def exists
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      return true    
    else
      flash[:alert] ="L'utilisateur n'existe pas."
      return false    
    end
  end

end
