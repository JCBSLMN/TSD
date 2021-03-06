class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:buy]
  before_action :set_ride, only: [:show, :edit, :update, :destroy, :buy]
  before_action :set_rides, only: [:index, :dashboard ]

#defines rides set
  def my_rides
    @rides = Ride.where(user_id: current_user) 
  end

  def dashboard
  end

  # GET /rides
  # GET /rides.json
  def index
    # @rides = Ride.all
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
    @user = current_user
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  


  # POST /rides
  # POST /rides.json
  def create
    @ride = Ride.new(ride_params)
    # Sets user id hidden value
    @ride.user_id = current_user.id

    respond_to do |format|
      if @ride.save
        format.html { redirect_to my_rides_path, notice: 'Ride was successfully created.' }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end

  
  end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


# stripe scripts
def buy
  Stripe.api_key = ENV['STRIPE_API_KEY']
  session = Stripe::Checkout::Session.create({
    payment_method_types: ['card'],
    mode: 'payment',
    success_url: success_url(params[:id]),
    cancel_url: cancel_url(params[:id]),
    line_items: [
      {
        price_data: {
          currency: 'aud',
          product_data: {
            name: @ride.id
          },
          unit_amount: (@ride.cost.to_f * 100).to_i
        },
        quantity: 1
      }
    ]
    })

    render json: session
end

# successful payment action
def success
  redirect_to root_path
end

# cancel payment action
def cancel
  redirect_to root_path
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    #set rides
    def set_rides
      @rides = Ride.all
    end


    # Only allow a list of trusted parameters through.
    def ride_params
      params.require(:ride).permit(:user_id, :location, :first_name, :last_name, :email, :details, :duration, :cost, :image)
    end
end
