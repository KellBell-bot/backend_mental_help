class AppointmentNotesController < ApplicationController
  before_action :set_appointment_note, only: [:show, :update, :destroy]

  # GET /appointment_notes
  def index
    @appointment_notes = AppointmentNote.all

    render json: @appointment_notes
  end

  # GET /appointment_notes/1
  def show
    render json: @appointment_note
  end

  # POST /appointment_notes
  def create
    @appointment_note = AppointmentNote.new(appointment_note_params)

    if @appointment_note.save
      render json: @appointment_note, status: :created, location: @appointment_note
    else
      render json: @appointment_note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointment_notes/1
  def update
    if @appointment_note.update(appointment_note_params)
      render json: @appointment_note
    else
      render json: @appointment_note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointment_notes/1
  def destroy
    @appointment_note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment_note
      @appointment_note = AppointmentNote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_note_params
      params.require(:appointment_note).permit(:notes, :user_id, :practitioner_id)
    end
end
