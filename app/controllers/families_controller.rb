class FamiliesController < ApplicationController
  # GET /control_families
  # GET /control_families.json
  def index
    @families = Family.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @families }
    end
  end

  # GET /control_families/1
  # GET /control_families/1.json
  def show
    @family = Family.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @family }
    end
  end

  # GET /control_families/new
  # GET /control_families/new.json
  def new
    @family = Family.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @family }
    end
  end

  # GET /control_families/1/edit
  def edit
    @family = Family.find(params[:id])
  end

  # POST /control_families
  # POST /control_families.json
  def create
    @family = Family.new(params[:family])

    respond_to do |format|
      if @family.save
        format.html { redirect_to @family, :notice => 'Control family was successfully created.' }
        format.json { render :json => @family, :status => :created, :location => @control_family }
      else
        format.html { render :action => "new" }
        format.json { render :json => @family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /control_families/1
  # PUT /control_families/1.json
  def update
    @family = Family.find(params[:id])

    respond_to do |format|
      if @family.update_attributes(params[:family])
        format.html { redirect_to @family, :notice => 'Control family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /control_families/1
  # DELETE /control_families/1.json
  def destroy
    @family = Family.find(params[:id])
    @family.destroy

    respond_to do |format|
      format.html { redirect_to families_url }
      format.json { head :no_content }
    end
  end
end
