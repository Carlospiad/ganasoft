class WeightHistoriesController < ApplicationController
  before_action :set_weight_history, only: [:show, :edit, :update, :destroy]
  before_action :load_asociated, only: [:edit,:new,:create]

  respond_to :html



  # GET /weight_histories
  # GET /weight_histories.json
  def index
    @weight_histories = WeightHistory.all
  end

  # GET /weight_histories/1
  # GET /weight_histories/1.json
  def show
  end

  # GET /weight_histories/new
  def new
    @weight_history = WeightHistory.new
    respond_with(@weight_history)

  end

  # GET /weight_histories/1/edit
  def edit
  end

  # POST /weight_histories
  # POST /weight_histories.json
  def create
    @weight_history = WeightHistory.new(weight_history_params)

    respond_to do |format|
      if @weight_history.save
        format.html { redirect_to @weight_history, notice: 'Weight history was successfully created.' }
        format.json { render :show, status: :created, location: @weight_history }
      else
        format.html { render :new }
        format.json { render json: @weight_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weight_histories/1
  # PATCH/PUT /weight_histories/1.json
  def update
    respond_to do |format|
      if @weight_history.update(weight_history_params)
        format.html { redirect_to @weight_history, notice: 'Weight history was successfully updated.' }
        format.json { render :show, status: :ok, location: @weight_history }
      else
        format.html { render :edit }
        format.json { render json: @weight_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_histories/1
  # DELETE /weight_histories/1.json
  def destroy
    @weight_history.destroy
    respond_to do |format|
      format.html { redirect_to weight_histories_url, notice: 'Weight history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight_history
      @weight_history = WeightHistory.find(params[:id])
    end

    def load_asociated
      @animals = Animal.all
      @weight_histories =WeightHistory.all

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_history_params
      params.require(:weight_history).permit(:weight, :animal_id, :date_of_weight, :animal_id, :brand_identification )
    end
end
