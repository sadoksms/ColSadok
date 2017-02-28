class ProjetsController < ApplicationController
  before_action :set_projet, only: [:show, :edit, :update, :destroy]

  # GET /projets
  # GET /projets.json
  def index
    #@projets = Projet.all
    @devices = Device.all.where(EstUniteActive: true)
    @projets = Projet.where(device_id: @devices)
  end

  # GET /projets/1
  # GET /projets/1.json
  def show
  end

  # GET /projets/new
  def new
    @projet = Projet.new
    @devices = Device.all.where(EstUniteActive: true)
  end

  # GET /projets/1/edit
  def edit
    @devices = Device.all
    if params[:status] == 'copy' 
      @projet = Projet.find(params[:id])
      @projet.name = @projet.name + " (copie)"
      @devices = Device.all
      render :action => 'copy'
    end        
  end

  
  # POST /projets
  # POST /projets.json
  def create
    @projet = Projet.new(projet_params)

    respond_to do |format|
      if @projet.save
        format.html { redirect_to projets_path, notice: 'Projet créé avec succés.' }
        format.json { render :show, status: :created, location: @projet }
      else
        format.html { render :new }
        format.json { render json: @projet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projets/1
  # PATCH/PUT /projets/1.json
  def update
    respond_to do |format|
      if @projet.update(projet_params)
        format.html { redirect_to projets_path, notice: 'Projet modifié avec succés.' }
        format.json { render :show, status: :ok, location: @projet }
      else
        format.html { render :edit }
        format.json { render json: @projet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projets/1
  # DELETE /projets/1.json
  def destroy
    @projet.destroy
    respond_to do |format|
      format.html { redirect_to projets_url, notice: 'Projet supprimé avec succés.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projet
      @projet = Projet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projet_params
      params.require(:projet).permit(:name, :objective, :device_id, :image)
    end
end
