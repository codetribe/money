class SheetsController < ApplicationController
  before_filter :ransack_object_init

  # GET /sheets
  # GET /sheets.json
  def index
    @sheets = Sheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sheets }
    end
  end

  # GET /sheets/1
  # GET /sheets/1.json
  def show
    @sheet = Sheet.find(params[:id])
    @records = @sheet.records
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sheet }
    end
  end

  # GET /sheets/new
  # GET /sheets/new.json
  def new
    @sheet = Sheet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sheet }
    end
  end

  # GET /sheets/1/edit
  def edit
    @sheet = Sheet.find(params[:id])
  end

  # POST /sheets
  # POST /sheets.json
  def create
    @sheet = Sheet.new(params[:sheet])

    respond_to do |format|
      if @sheet.save
        format.html { redirect_to sheets_path, notice: "Sheet #{@sheet.name} was successfully created." }
        format.json { render json: @sheet, status: :created, location: @sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sheets/1
  # PUT /sheets/1.json
  def update
    @sheet = Sheet.find(params[:id])

    respond_to do |format|
      if @sheet.update_attributes(params[:sheet])
        format.html { redirect_to @sheet, notice: 'Sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheets/1
  # DELETE /sheets/1.json
  def destroy
    @sheet = Sheet.find(params[:id])
    sheet_name = @sheet.name
    @sheet.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: "Sheet #{sheet_name} was deleted!"}
      format.json { head :no_content }
    end
  end

  def income
    @sheet = Sheet.find(params[:id])
    @records = @sheet.records.where(pending: false, income: true)
    render :show
  end

  def expense
    @sheet = Sheet.find(params[:id])
    @records = @sheet.records.where(pending: false, income: false)
    render :show
  end

  def pending_income
    @sheet = Sheet.find(params[:id])
    @records = @sheet.records.where(pending: true, income: true)
    render :show
  end

  def pending_expense
    @sheet = Sheet.find(params[:id])
    @records = @sheet.records.where(pending: true, income: false)
    render :show
  end

  def search
    @sheets = @q.result
    render :index
  end

  private

  def ransack_object_init
     @q = Sheet.search(params[:q])
  end
end
