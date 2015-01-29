class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy]
#respond_to :html, :xml, :json, :js
  # GET /trails
  # GET /trails.json
  def index
    @trails = Trail.all
  end

  # GET /trails/1
  # GET /trails/1.json
  def show
    @trail = Trail.find(params[:id])

      #respond_with(@trail) do |format|
       # format.js {render :json => @trail, :callback => params[:callback]}
      #end
  end

  # GET /trails/new
  def new
    @trail = Trail.new
    @trail.url = params[:url]
    @trail.name = params[:title]
    @trail.lon = params[:lon]
    @trail.lat = params[:lat]
  end

  # GET /trails/1/edit
  def edit
  end

  # POST /trails
  # POST /trails.json
  def create
    @trail = Trail.new(trail_params)

    respond_to do |format|
      if @trail.save
        format.html { redirect_to @trail, notice: 'Trail was successfully created.' }
        format.json { render :show, status: :created, location: @trail }
      else
        format.html { render :new }
        format.json { render json: @trail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trails/1
  # PATCH/PUT /trails/1.json
  def update
    respond_to do |format|
      if @trail.update(trail_params)
        format.html { redirect_to @trail, notice: 'Trail was successfully updated.' }
        format.json { render :show, status: :ok, location: @trail }
      else
        format.html { render :edit }
        format.json { render json: @trail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trails/1
  # DELETE /trails/1.json
  def destroy
    @trail.destroy
    respond_to do |format|
      format.html { redirect_to trails_url, notice: 'Trail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trail
      @trail = Trail.find(params[:id])
    end
    

        def trail_params
        params.require(:trail).permit(:name, :url, :lat, :lon )
        end
end
