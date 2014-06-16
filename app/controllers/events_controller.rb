class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :register]
  before_action :authenticate_user!, only: [:new,:create,:update, :destroy]


  # GET /events
  # GET /events.json
  def index
    @events = Event.all.sort(created_at: -1)
  end

  def potvrdi
    @event = Event.find(params[:id])
    redirect_to @event, notice: 'Vasa Akcija Je Potvrdjena. Shareujte akciju na FB kako bi povecali odaziv. '
  end
  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @user = current_user
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Email sa verifikacijom vam je poslat na vasu email adresu. Molimo potvrdite' }
        format.json { render :show, status: :created, location: @event }
        EventsMailer.create_event(@user).deliver
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def register
    @event.registrations += 1
    @event.save
    redirect_to @event, notice: 'Uspesno ste se prijavili!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :location, :description, :category, :priority, :tag, :registrations, :adresa, :grad, :telefon)
    end
end
