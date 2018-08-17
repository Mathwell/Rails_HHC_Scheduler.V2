class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]


  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    #binding.pry
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'New patient account was successfully created.' }
      else
        @patient.save
        raise @patient.inspect
        format.html { redirect_to patients_path }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient account was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Nurse account was successfully destroyed.' }
    end
  end

  def index
    @patients=Patient.all
  end

  def show
    @visits = @patient.visits
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(
        :first_name,
        :last_name,
        :nurse_id
            )
    end
end
