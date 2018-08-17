class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def choose_nurse
    #raise params.inspect
    if params[:nurse][:id]!=""
       @nurse=Nurse.find(params[:nurse][:id])
       @patients=@nurse.patients
        respond_to do |format|
          format.html { redirect_to nurse_patients_path(@nurse.id) }
       end
     else
       respond_to do |format|
         format.html { redirect_to patients_path }
      end
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @nurse=Nurse.find(@patient.nurse_id)
    #@nurse.patients<<@patient
    #raise @nurse.inspect
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
    #raise params.inspect
    if params[:nurse_id]
      @nurse=Nurse.find(params[:nurse_id])
       @patients=@nurse.patients
      #raise @nurse.inspect
    else
      @patients=Patient.all
    end
    #@nurses=Nurse.all
    #@patients=Patient.all
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
