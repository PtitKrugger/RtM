class TachesController < ApplicationController
  before_action :set_tache, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /taches or /taches.json
  def index
    etat = params[:etat]
    @col = params[:col]

    if etat == '1' || etat == '2'
      @taches = Tache.where(etat_id: "#{etat}")
    else
      @taches = Tache.all
    end

    if @col.present?
      if session['ordre'].blank? || session['ordre'] == "DESC"
        session['ordre'] = "ASC"
      else
        session['ordre'] = "DESC"
      end

      if @col == "etat"
        @taches = Tache.order(etat_id: "#{session['ordre']}")
      end

      if @col == "date_crea"
        @taches = Tache.order(created_at: "#{session['ordre']}")
      end

      if @col == "date_prevue"
        @taches = Tache.order(date_prevue: "#{session['ordre']}")
      end
    end
  end

  # GET /taches/1 or /taches/1.json
  def show
  end

  # GET /taches/new
  def new
    @tache = Tache.new
  end

  # GET /taches/1/edit
  def edit
  end

  # POST /taches or /taches.json
  def create
    @tache = Tache.new(tache_params)

    respond_to do |format|
      if @tache.save
        format.html { redirect_to tache_url(@tache), notice: "La tâche a bien été crée." }
        format.json { render :show, status: :created, location: @tache }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tache.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taches/1 or /taches/1.json
  def update
    respond_to do |format|
      if @tache.update(tache_params)
        format.html { redirect_to tache_url(@tache), notice: "La tâche a bien été mise à jour. " } 
        format.json { render :show, status: :ok, location: @tache }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tache.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taches/1 or /taches/1.json 
  def destroy
    ids = Array(params[:id].split(","))
    Tache.where(id: ids).destroy_all 
    respond_to do |format|
      format.html { redirect_to taches_url, notice: "La tâche a bien été détruite."} 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tache
      @tache = Tache.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tache_params
      params.require(:tache).permit(:id, :descriptif, :created_at, :updated_at,:importance_id, :date_prevue, :etat_id)
    end
end
