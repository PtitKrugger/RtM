class ImportancesController < ApplicationController
  before_action :set_importance, only: %i[ show edit update destroy ]

  # GET /importances or /importances.json
  def index
    @importances = Importance.all
  end

  # GET /importances/1 or /importances/1.json
  def show
  end

  # GET /importances/new
  def new
    @importance = Importance.new
  end

  # GET /importances/1/edit
  def edit
  end

  # POST /importances or /importances.json
  def create
    @importance = Importance.new(importance_params)

    respond_to do |format|
      if @importance.save
        format.html { redirect_to importance_url(@importance), notice: "Importance was successfully created." }
        format.json { render :show, status: :created, location: @importance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @importance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /importances/1 or /importances/1.json
  def update
    respond_to do |format|
      if @importance.update(importance_params)
        format.html { redirect_to importance_url(@importance), notice: "Importance was successfully updated." }
        format.json { render :show, status: :ok, location: @importance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @importance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /importances/1 or /importances/1.json
  def destroy
    @importance.destroy

    respond_to do |format|
      format.html { redirect_to importances_url, notice: "Importance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_importance
      @importance = Importance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def importance_params
      params.require(:importance).permit(:descriptif, :codecouleur, :tache_id)
    end
end
