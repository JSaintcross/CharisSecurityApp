class ControlFamiliesController < ApplicationController
  # GET /control_families
  # GET /control_families.json
  def index
    @control_families = ControlFamily.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @control_families }
    end
  end

  # GET /control_families/1
  # GET /control_families/1.json
  def show
    @control_family = ControlFamily.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @control_family }
    end
  end

  # GET /control_families/new
  # GET /control_families/new.json
  def new
    @control_family = ControlFamily.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @control_family }
    end
  end

  # GET /control_families/1/edit
  def edit
    @control_family = ControlFamily.find(params[:id])
  end

  # POST /control_families
  # POST /control_families.json
  def create
    @control_family = ControlFamily.new(params[:control_family])

    respond_to do |format|
      if @control_family.save
        format.html { redirect_to @control_family, :notice => 'Control family was successfully created.' }
        format.json { render :json => @control_family, :status => :created, :location => @control_family }
      else
        format.html { render :action => "new" }
        format.json { render :json => @control_family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /control_families/1
  # PUT /control_families/1.json
  def update
    @control_family = ControlFamily.find(params[:id])

    respond_to do |format|
      if @control_family.update_attributes(params[:control_family])
        format.html { redirect_to @control_family, :notice => 'Control family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @control_family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /control_families/1
  # DELETE /control_families/1.json
  def destroy
    @control_family = ControlFamily.find(params[:id])
    @control_family.destroy

    respond_to do |format|
      format.html { redirect_to control_families_url }
      format.json { head :no_content }
    end
  end
end
