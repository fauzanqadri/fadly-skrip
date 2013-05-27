class NasabahsController < ApplicationController
  load_and_authorize_resource
  # GET /nasabahs
  # GET /nasabahs.json
  def index
    @nasabahs = Nasabah.paginate(:page => params[:page]).order('created_at desc')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nasabahs }
    end
  end

  # GET /nasabahs/1
  # GET /nasabahs/1.json
  def show
    @nasabah = Nasabah.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nasabah }
    end
  end

  # GET /nasabahs/new
  # GET /nasabahs/new.json
  def new
    @nasabah = current_user.nasabahs.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nasabah }
    end
  end

  # GET /nasabahs/1/edit
  def edit
    @nasabah = Nasabah.find(params[:id])
  end

  # POST /nasabahs
  # POST /nasabahs.json
  def create
    @nasabah = current_user.nasabahs.new(params[:nasabah])

    respond_to do |format|
      if @nasabah.save
        format.html { redirect_to @nasabah, notice: 'Nasabah was successfully created.' }
        format.json { render json: @nasabah, status: :created, location: @nasabah }
      else
        format.html { render action: "new" }
        format.json { render json: @nasabah.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nasabahs/1
  # PUT /nasabahs/1.json
  def update
    @nasabah = Nasabah.find(params[:id])

    respond_to do |format|
      if @nasabah.update_attributes(params[:nasabah])
        format.html { redirect_to @nasabah, notice: 'Nasabah was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nasabah.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nasabahs/1
  # DELETE /nasabahs/1.json
  def destroy
    @nasabah = Nasabah.find(params[:id])
    @nasabah.destroy

    respond_to do |format|
      format.html { redirect_to nasabahs_url }
      format.json { head :no_content }
    end
  end
  
  def approve
    @nasabah = Nasabah.approve(params[:id])
    respond_to do |format|
      format.html { redirect_to nasabahs_url }
      format.json { head :no_content }
    end
  end
end
