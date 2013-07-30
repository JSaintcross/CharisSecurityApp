class BaselinesController < ApplicationController
  # GET /baselines
  # GET /baselines.json
  def index
    @baselines = Baseline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @baselines }
    end
  end

  # GET /baselines/1
  # GET /baselines/1.json
  def show
    @baseline = Baseline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @baseline }
    end
  end

  # GET /baselines/new
  # GET /baselines/new.json
  def new
    @baseline = Baseline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @baseline }
    end
  end

  # GET /baselines/1/edit
  def edit
    @baseline = Baseline.find(params[:id])
  end

  # POST /baselines
  # POST /baselines.json
  def create
    @baseline = Baseline.new(params[:baseline])

    respond_to do |format|
      if @baseline.save
        format.html { redirect_to @baseline, :notice => 'Baseline was successfully created.' }
        format.json { render :json => @baseline, :status => :created, :location => @baseline }
      else
        format.html { render :action => "new" }
        format.json { render :json => @baseline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /baselines/1
  # PUT /baselines/1.json
  def update
    @baseline = Baseline.find(params[:id])

    respond_to do |format|
      if @baseline.update_attributes(params[:baseline])
        format.html { redirect_to @baseline, :notice => 'Baseline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @baseline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /baselines/1
  # DELETE /baselines/1.json
  def destroy
    @baseline = Baseline.find(params[:id])
    @baseline.destroy

    respond_to do |format|
      format.html { redirect_to baselines_url }
      format.json { head :no_content }
    end
  end
end
