class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]


  def filter_by_nurse
    #raise params.inspect
    if !params[:visit][:nurse_id].blank?
       @nurse=Nurse.find(params[:visit][:nurse_id])
       respond_to do |format|
          format.html { redirect_to nurse_visits_path(@nurse.id) }
       end
     else
       if !params[:visit][:patient_id].blank?
          @patient=Patient.find(params[:visit][:patient_id])
           respond_to do |format|
             format.html { redirect_to patient_visits_path(@patient.id) }
            end
        else
          respond_to do |format|
            format.html { redirect_to visits_path }
          end
        end
      end
  end

  def new
    @visit=Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    @nurse=Nurse.find(@visit.nurse_id)
    @patient=Patient.find(@visit.patient_id)
    #@nurse.patients<<@patient
    #raise @nurse.inspect
    #binding.pry
    respond_to do |format|
      if @visit.save
        format.html { redirect_to @visit, notice: 'New visit was successfully created.' }
      else
        @visit.save
        raise @visit.inspect
        format.html { redirect_to visits_path }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

  def index
    raise params.inspect
    if !params[:nurse_id].blank?
      @nurse=Nurse.find(params[:nurse_id])
      @visits=Visit.where(nurse_id: params[:nurse_id])
    else
      if !params[:patient_id].blank?
        @visits=Visit.where(patient_id: params[:patient_id])
      else
        @visits=Visit.all
      end
    end
  end

  def show

  end

  private
 def set_visit
     @visit=Visit.find(params[:id])
 end

  def visit_params
    params.require(:visit).permit(
      :nurse_id,
      :patient_id,
      :date
          )
  end
end
