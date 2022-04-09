class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new

    @customer = Customer.all
    @building = Building.all
    @battery = Battery.all
    @column = Column.all
    @elevator = Elevator.all
    @employee = Employee.all
    
    user = Employee.find(current_user.id)
    @author = user.first_name + " " + user.last_name
    @authoremail = user.email
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
# freshdesk
    cie = @lead.cie_name.to_s.gsub(/\s+/, '')
    dirname = Rails.root.join('public','uploads', cie)
    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end

     
      if @customer.Company_Name == nil
        @customer.Company_Name= "n/a"
      end
      if @intervention.buildingID == nil
        @intervention.buildingID  = "n/a"
      end
      if @intervention.batteryID == nil
        @intervention.batteryID = "n/a"
      end
      if @intervention.columnID  == nil
        @intervention.columnID = "n/a"
      end
      if @intervention.elevatorID == nil
        @intervention.elevatorID = "n/a"
      end
      if @intervention.employeeID == nil
        @intervention.employeeID = "n/a"
      end
      if @intervention.report == nil
        @intervention.report = "n/a"
      end
      site = RestClient::Resource.new(ENV['FRESHDESK_URL'], ENV["FRESHDESK_API_KEY"], 'X')
      url = ENV['FRESHDESK_URL']

      data_wo_attachment = {
        "status": 2, 
        "priority": 1,
        "name": @author,
        "email": @authoremail,
        "description": 
            "Intervention #" + @intervention.id
          "The contact" + @lead.full_name + " from company " + @lead.cie_name + " can be reached at email " + @lead.email + " and at phone number " + @lead.phone + ". " + @lead.department_in_charge + " has a project named " + @lead.project_name + " which would require contribution from Rocket Elevators. The project description is " + @lead.project_description + ". Attached message: " + @lead.message + ". The Contact has " + has_attachment + " uploaded an attachment.",
        "type": "Intervention",
        "subject": "Intervention #" + @intervention.id,
      }
      data_json = JSON.generate(data_wo_attachment)
      site.post(data_json, :content_type => "application/json"){ |response, request, result, &block|
      if [301, 302, 307].include? response.code
        redirected_url = response.headers[:location]
    respond_to do |format|
      if @intervention.save
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  def interventions
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy

    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

        # building_by_customer

  def get_building_by_customer
    @building = Building.where("customer_id = ?", params[:customer_id])
    respond_to do |format|
      format.json { render :json => @building }
    end
  end

        #battery_by_building
        def get_battery_by_building
            @battery = Battery.where("building_id = ?", params[:building_id])
            respond_to do |format|
              format.json { render :json => @battery }
            end
        end
    
        #column_by_battery

        def get_column_by_battery
            @column = Column.where("battery_id = ?", params[:battery_id])
            respond_to do |format|
              format.json { render :json => @column }
            end
        end

        #elevator_by_column

        def get_elevator_by_column
            @elevator = Elevator.where("column_id = ?", params[:column_id])
            respond_to do |format|
              format.json { render :json => @elevator }
            end
        end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
    #   params.fetch(:intervention, {})
      params.require(:intervention).permit(:customerID,:buildingID,:batteryID,:columnID,:elevatorID,:employeeID,:report, :author)
    
    end
end