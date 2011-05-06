class UsersController < ApplicationController
  
before_filter :authenticate, :except => [:new, :create]
 # GET /users

  # GET /users.xml

  def index

    @users = User.all

    @messages=Message.all


    respond_to do |format|

      format.html # index.html.erb

      format.xml  { render :xml => @users }

    end

  end




  # GET /users/1
  # GET /users/1.xml

  def show

    @user = User.find(params[:id])


    respond_to do |format|

      format.html # show.html.erb

      format.xml  { render :xml => @user }

    end

  end

 

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => 'User successfully added.'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => 'Updated user information successfully.'
    else
      render :action => 'edit'
    end
  end
end