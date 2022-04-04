class QuotesController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!, only: %i[ index show edit update destroy ]
  before_action :set_quote, only: %i[ show edit update destroy ]

  # GET /quotes or /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  def preview
    @quote = Quote.find(params[:id])
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save

        tickets_conn = Freshdesk::Tickets.new({
          :apikey => ENV["FRESHDESK_API_KEY"],
          :domain => ENV["FRESHDESK_API"],
        })
    

        if @quote.fullName == nil
          @quote.fullName = "n/a"
        end
        if @quote.companyName == nil
          @quote.companyName = "n/a"
        end
        if @quote.email == nil
          @quote.email = "n/a"
        end
        if @quote.phone == nil
          @quote.phone = "n/a"
        end
        if @quote.projectName == nil
          @quote.projectName = "n/a"
        end
        if @quote.projectDesc == nil
          @quote.projectDesc = "n/a"
        end
        if @quote.department == nil
          @quote.department = "n/a"
        end
        if @quote.message == nil
          @quote.message = "n/a"
        end
      
        data = {
          "status": 2, 
          "priority": 1,
          "name": @quote.fullName, 
          "phone": @quote.phone,
          "email": @quote.email,
          "description": 
            "The contact" + @quote.fullName + " from company " + @quote.companyName + " can be reached at email " + @quote.email + " and at phone number " + @quote.phone + ". " + @quote.department + " has a project named " + @quote.projectName + " which would require contribution from Rocket Elevators. The project description is " + @quote.projectDesc + ". Attached message: " + @quote.message + ".",
          "type": "Feature Request",
          "subject": @quote.fullName + " from " + @quote.companyName,
        }
        tickets_conn.create(options = {headers: 'application/json'}, body = data)

        format.html { redirect_to preview_quote_url(@quote), notice: "Please see your results below!" }
        format.json { render :preview, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:fullName, :phone, :department, :projectName, :projectDesc, :message, :companyName, :email,:building_type, :product_line, :no_of_apartments, :no_of_floors, :no_of_basements, :no_of_businesses, :no_of_parking_spaces, :no_of_elevator_cages, :max_of_occupants_per_floor, :no_of_hours_of_activities, :no_of_elevators_needed, :unit_price, :total_price_of_elevators, :installation_fees, :final_price,)
    end
end
