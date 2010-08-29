class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    if params[:id] == 'current' 
      @user = current_user
    else
      @user = User.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    if current_user
      flash[:warning] = "<strong>#{current_user.username}</strong>! You are already logged in, because you can do this after logged out"
      redirect_to root_url
    else
      @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @user }
      end
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'Registration successful.'
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Successfully updated profile.'
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    if false
      @user = current_user
      @user.destroy

      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end
    else
      flash[:warning] = 'Premission denied!'
      redirect_to root_url
    end
  end
end
