class HussarsController < ApplicationController
  before_action :set_hussar, only: [:show, :edit, :update, :destroy]

  # GET /hussars
  # GET /hussars.json
  def index
    @hussars = Hussar.all
  end

  # GET /hussars/1
  # GET /hussars/1.json
  def show
  end

  # GET /hussars/new
  def new
    @hussar = Hussar.new
  end

  # GET /hussars/1/edit
  def edit
  end

  # POST /hussars
  # POST /hussars.json
  def create
    @hussar = Hussar.new(hussar_params)

    respond_to do |format|
      if @hussar.save
        format.html { redirect_to @hussar, notice: 'Hussar was successfully created.' }
        format.json { render :show, status: :created, location: @hussar }
      else
        format.html { render :new }
        format.json { render json: @hussar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hussars/1
  # PATCH/PUT /hussars/1.json
  def update
    respond_to do |format|
      if @hussar.update(hussar_params)
        format.html { redirect_to @hussar, notice: 'Hussar was successfully updated.' }
        format.json { render :show, status: :ok, location: @hussar }
      else
        format.html { render :edit }
        format.json { render json: @hussar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hussars/1
  # DELETE /hussars/1.json
  def destroy
    @hussar.destroy
    respond_to do |format|
      format.html { redirect_to hussars_url, notice: 'Hussar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hussar
      @hussar = Hussar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hussar_params
      params.require(:hussar).permit(:name, :born)
    end
end
