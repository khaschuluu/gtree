class TabsController < ApplicationController
  # GET /tabs
  # GET /tabs.xml
  def index
      @tabs = Tab.paginate :per_page => 10, :page => params[:page], 
                           :conditions => ['(title LIKE ? OR tag LIKE ?) AND user_id LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:user_id]}%"],
                           :order => params[:order_by]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tabs }
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
      flash[:warning] = (t'flash.premission_denied') + (t'flash.cant_add_tab')
      redirect_to root_url
    end
  end

  # GET /tabs/1/edit
  def edit
    if current_user
      if current_user.id == Tab.find(params[:id]).user_id
        @tab = Tab.find(params[:id])
      else
        flash[:warning] = t'flash.premission_denied'
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
        flash[:notice] = t'flash.tab_created'
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
        flash[:notice] = t'flash.tab_udated'
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

      flash[:notice] = t'flash.tab_deleted'
      redirect_to root_url
      #respond_to do |format|
      #  format.html { redirect_to(tabs_url) }
      #  format.xml  { head :ok }
      #end
    else
      flash[:warning] = t'flash.premission_denied'
      redirect_to root_url
    end
  end
end
