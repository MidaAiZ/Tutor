class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  #index动作后期要删除

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        Student.create(account_id: @account.id)
        format.html { redirect_to login_path, notice: 'Account was successfully created.' }
        # format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        # format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def login
      @account = Account.find_by(number: params[:number], pwd: params[:pwd])
      respond_to do |format|
          if @account
              session[:user_num] = @account.number
              session[:user_id] = @account.id
              format.html { redirect_to root_path, notice: 'Account was successfully login.' }
              format.json { render :login }
          else
              format.html { redirect_to login_path, notice: 'Account was successfully fail.' }
              format.json { render :login }
         end
      end
  end
  def logout
      respond_to do |format|
        session[:user_id] = nil
        format.html { redirect_to root_path, notice: 'Account was logout.' }
        format.json { render :show, status: :created, location: @account }
        end
  end
  def register
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.readonly.find(session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:number, :pwd, :username, :realname, :sex, :phone, :email, :born_date, :is_teacher, :is_vip, :is_access)
    end
end
