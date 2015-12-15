class OffensesController < ApplicationController
  before_action :set_offense, only: [:show, :edit, :update, :destroy]

  # GET /offenses
  # GET /offenses.json
  def index
    @offenses = Offense.all
  end

  # GET /offenses/1
  # GET /offenses/1.json
  def show
  end

  # GET /offenses/new
  def new
    @offense = Offense.new
  end

  # GET /offenses/1/edit
  def edit
  end

  # POST /offenses
  # POST /offenses.json
  def create
    params[:offense] = {:ip_address => request.ip}
    @offense = Offense.new(offense_params)

    respond_to do |format|
      if @offense.save
        format.html { redirect_to @offense, notice: 'Offense was successfully created.' }
        format.json { render :show, status: :created, location: @offense }
      else
        format.html { render :new }
        format.json { render json: @offense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offenses/1
  # PATCH/PUT /offenses/1.json
  def update
    respond_to do |format|
      if @offense.update(offense_params)
        format.html { redirect_to @offense, notice: 'Offense was successfully updated.' }
        format.json { render :show, status: :ok, location: @offense }
      else
        format.html { render :edit }
        format.json { render json: @offense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offenses/1
  # DELETE /offenses/1.json
  def destroy
    @offense.destroy
    respond_to do |format|
      format.html { redirect_to offenses_url, notice: 'Offense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offense
      @offense = Offense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def offense_params
    #  params[:offense]
    #end
    # Whitelisting IP Address
    def offense_params
      params.require(:offense).permit(:ip_address)
    end
end
