class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy place_order]
  before_action :set_form_vars, only: %i[ new edit ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # GET search
  def search
    if params[:selected] == 'title'
    @listings = Listing.where("title ILIKE ?", "%" + params[:q] + "%")
    pp @listings
    elsif params[:selected] == 'suburb'
    @listings = Listing.joins(user:[:address]).where("suburb ILIKE ?", "%" + params[:q] + "%")
    end
  end

  # POST /listings or /listings.json
  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def place_order
    Order.create(
      listing_id: @listing.id,
      seller_id: @listing.user_id,
      buyer_id: @current_user.id
    )

    @listing.update(sold: true)

    redirect_to orders_success_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_form_vars
      @allergies = Allergy.all
    end

    # method to check user who owns listing is the logged in user
    def authorize_user
      if @listing.user_id != current_user.id
        flash[:alert] = "we are unable to proceed with that action, please sign in"
        redirect_to listings_path
      end
    end


    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :cuisine, :description, :price, :available_date, :sold, :user_id, :allergy_id, :image)
    end
end
