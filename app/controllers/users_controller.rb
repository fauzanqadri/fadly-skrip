class UsersController < ApplicationController 
  load_and_authorize_resource except: [:profile, :edit_profile, :do_edit_profile]
  
  def index
    @users = User.paginate(:page => params[:page]).order('created_at desc')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
  
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
  
  def uppdate
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
  def create
    @user = User.new_inside(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def profile
  end
  
  def edit_profile
  end
  
  def do_edit_profile
    respond_to do |format|
      if current_user.update_attributes(params[:user])
        format.html { redirect_to root_url, notice: 'User was successfully updated.' }
      else
         current_user.errors.each do |k,v|
            flash[:error] = "#{k} #{v}"
         end
        format.html { render action: "edit_profile" }
      end
    end
  end
  
end
