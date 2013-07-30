class SubcontrolsController < ApplicationController
  # GET /subcontrols
  # GET /subcontrols.json
  def index
    @subcontrols = Subcontrol.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @subcontrols }
    end
  end

  # GET /subcontrols/1
  # GET /subcontrols/1.json
  def show
    @subcontrol = Subcontrol.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @subcontrol }
    end
  end

  # GET /subcontrols/new
  # GET /subcontrols/new.json
  def new
    @subcontrol = Subcontrol.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @subcontrol }
    end
  end

  # GET /subcontrols/1/edit
  def edit
    @subcontrol = Subcontrol.find(params[:id])
  end

  # POST /subcontrols
  # POST /subcontrols.json
  def create
    @subcontrol = Subcontrol.new(params[:subcontrol])

    respond_to do |format|
      if @subcontrol.save
        format.html { redirect_to @subcontrol, :notice => 'Subcontrol was successfully created.' }
        format.json { render :json => @subcontrol, :status => :created, :location => @subcontrol }
      else
        format.html { render :action => "new" }
        format.json { render :json => @subcontrol.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subcontrols/1
  # PUT /subcontrols/1.json
  def update
    @subcontrol = Subcontrol.find(params[:id])

    respond_to do |format|
      if @subcontrol.update_attributes(params[:subcontrol])
        format.html { redirect_to @subcontrol, :notice => 'Subcontrol was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @subcontrol.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subcontrols/1
  # DELETE /subcontrols/1.json
  def destroy
    @subcontrol = Subcontrol.find(params[:id])
    @subcontrol.destroy

    respond_to do |format|
      format.html { redirect_to subcontrols_url }
      format.json { head :no_content }
    end
  end
end
