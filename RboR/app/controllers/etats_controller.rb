class EtatsController < ApplicationController
  before_action :set_etat, only: %i[ show edit update destroy ]

  # GET /etats or /etats.json
  def index
    @etats = Etat.all
  end

  # GET /etats/1 or /etats/1.json
  def show
  end

  # GET /etats/new
  def new
    @etat = Etat.new
  end

  # GET /etats/1/edit
  def edit
  end

  # POST /etats or /etats.json
  def create
    @etat = Etat.new(etat_params)

    respond_to do |format|
      if @etat.save
        format.html { redirect_to etat_url(@etat), notice: "Etat was successfully created." }
        format.json { render :show, status: :created, location: @etat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @etat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etats/1 or /etats/1.json
  def update
    respond_to do |format|
      if @etat.update(etat_params)
        format.html { redirect_to etat_url(@etat), notice: "Etat was successfully updated." }
        format.json { render :show, status: :ok, location: @etat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @etat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etats/1 or /etats/1.json
  def destroy
    @etat.destroy

    respond_to do |format|
      format.html { redirect_to etats_url, notice: "Etat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etat
      @etat = Etat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def etat_params
      params.require(:etat).permit(:etat)
    end
end
