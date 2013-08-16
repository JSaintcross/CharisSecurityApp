class UsersController < ApplicationController

  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
    end
  end


  def create
    @user = User.new(params[:user])

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save
      flash[:notice] = "Your account has been created."
      redirect_to :home
    else
      flash[:error] = "There was a problem creating your account."
      render :action => :new
    end

  end


  def show
    @user = current_user
   respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
   end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path
      flash[:notice] = "Account updated!"

    else
      render :action => :edit
    end
  end

end