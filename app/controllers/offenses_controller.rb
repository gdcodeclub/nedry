class OffensesController < ApplicationController
  before_action :set_offense, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_admin_user!, only: [:new, :create]

 def client
  GovDelivery::TMS::Client.new(ENV['NEDRY_TMS_TOKEN'], :api_root => 'https://stage-tms.govdelivery.com')
 end

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

  def email
    # default api root endpoint is https://tms.govdelivery.com
    # For details https://jira.govdelivery.com/browse/ES-5154
    #client = GovDelivery::TMS::Client.new(ENV['NEDRY_TMS_TOKEN'], :api_root => 'https://stage-tms.govdelivery.com')
    message = client.email_messages.build(:body=>'<p><a href="http://example.com">Visit here</a></p>',
                                      :subject => 'Hey',
                                      :from_email => 'nedry@public.govdelivery.com',
                                      :from_name => 'GovDelivery Code Club @TM')
    message.recipients.build(:email=> @offense.email )
    message.post             # true
    @offense.email_id = message.id
    message.get # To test if post succeeded
  end

  def sms
    #to send sms message
    message = client.sms_messages.build(:body=>'Test Message!')
    message.recipients.build(:phone=>@offense.phone)
    message.post             # true
    @offense.sms_id = message.id # this is the message id
    # message.href             # "/messages/sms/87"
    message.get              # <GovDelivery::TMS::SmsMessage href=/messages/sms/87 attributes={...}>
  end

  # GET /offenses/1/edit
  def edit
  end

  # POST /offenses
  # POST /offenses.json
  def create
    host_name = begin
      Resolv.getname(request.ip)
    rescue Resolv::ResolvError
    end || 'n/a'

    params[:offense] = {:ip_address => request.ip, :host_name => host_name}
    @offense = Offense.new(offense_params)
    respond_to do |format|
      if @offense.save
        if @offense.email?
          # send an email
        end
        if @offense.phone?
          # send an sms message
        end
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
      params.require(:offense).permit(:ip_address, :host_name)
    end
end
