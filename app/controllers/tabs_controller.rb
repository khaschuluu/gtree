class TabsController < ApplicationController
  # GET /tabs
  # GET /tabs.xml
  def index
    @tabs = Tab.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tabs }
    end
  end

  # GET /tabs/user/id
  # GET /tabs/user/id.xml
  def index_user
    @tabs = Tab.find(User.find(params[:id]))

    respond_to do |format|
      format.html #index_user.html.erb
      format.xml { render :xml => @tabs }
    end
  end

  # GET /tabs/1
  # GET /tabs/1.xml
  def show
    @tab = Tab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tab }
    end
  end

  # GET /tabs/new
  # GET /tabs/new.xml
  def new
    if current_user
      @tab = Tab.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @tab }
      end
    else
      flash[:warning] = 'Premission denied! You\'ll can this after logged in! If you not registered, you can register now ;)'
      redirect_to root_url
    end
  end

  # GET /tabs/1/edit
  def edit
    if current_user
      if current_user.id == Tab.find(params[:id]).user_id
        @tab = Tab.find(params[:id])
      else
        flash[:warning] = 'Premission denied!'
        redirect_to root_url
      end
    end
  end

  # POST /tabs
  # POST /tabs.xml
  def create
    @tab = Tab.new(params[:tab])
    @tab.user_id = current_user.id

    respond_to do |format|
      if @tab.save
        flash[:notice] = "<strong>#{@tab.title}</strong> was successfully created."
        format.html { redirect_to(@tab) }
        format.xml  { render :xml => @tab, :status => :created, :location => @tab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tabs/1
  # PUT /tabs/1.xml
  def update
    @tab = Tab.find(params[:id])

    respond_to do |format|
      if @tab.update_attributes(params[:tab])
        flash[:notice] = "<strong>#{@tab.title}</strong> was successfully updated."
        format.html { redirect_to(@tab) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.xml
  def destroy
    if current_user
      @tab = Tab.find(params[:id])
      @tab.destroy

      flash[:notice] = "<strong>#{@tab.title}</strong> is successfully deleted"
      redirect_to root_url
      #respond_to do |format|
      #  format.html { redirect_to(tabs_url) }
      #  format.xml  { head :ok }
      #end
    else
      flash[:warning] = 'Premission denied!'
      redirect_to root_url
    end
  end
end
