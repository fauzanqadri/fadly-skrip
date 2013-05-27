class SetoransController < ApplicationController
  load_and_authorize_resource
  # GET /setorans
  # GET /setorans.json
  def index
    @setorans = Setoran.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setorans }
    end
  end

  # GET /setorans/1
  # GET /setorans/1.json
  def show
    @setoran = Setoran.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setoran }
    end
  end

  # GET /setorans/new
  # GET /setorans/new.json
  def new
    @setoran = current_user.setorans.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @setoran }
    end
  end

  # GET /setorans/1/edit
  def edit
    @setoran = Setoran.find(params[:id])
  end

  # POST /setorans
  # POST /setorans.json
  def create
    @setoran = current_user.setorans.new(params[:setoran])

    respond_to do |format|
      if @setoran.save
        format.html { redirect_to @setoran, notice: 'Setoran was successfully created.' }
        format.json { render json: @setoran, status: :created, location: @setoran }
      else
        format.html { render action: "new" }
        format.json { render json: @setoran.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /setorans/1
  # PUT /setorans/1.json
  def update
    @setoran = Setoran.find(params[:id])

    respond_to do |format|
      if @setoran.update_attributes(params[:setoran])
        format.html { redirect_to @setoran, notice: 'Setoran was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setoran.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setorans/1
  # DELETE /setorans/1.json
  def destroy
    @setoran = Setoran.find(params[:id])
    @setoran.destroy

    respond_to do |format|
      format.html { redirect_to setorans_url }
      format.json { head :no_content }
    end
  end
  
  def get_user
    unless params[:query].nil?
      id = params[:query].to_i > 0 ? params[:query].to_i : false
      name = params[:query].to_i == 0 ? params[:query] : false
      @result = Nasabah.where('id > 0')
      @result = @result.where('id = ?', id) if id
      # @result = @result.where('nama_lengkap like ?', "%#{name}%") if name
    else
      @result = []
    end
    render :json => @result
  end
end
