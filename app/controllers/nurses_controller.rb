class NursesController < ApplicationController
  before_action :set_nurse, only: [:show, :edit, :update, :destroy]
  def new
    @nurse = Nurse.new
  end

  def create
    @nurse = Nurse.new(nurse_params)
    respond_to do |format|
      if @nurse.save
        format.html { redirect_to @nurse, notice: 'New nurse account was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @nurse.update(nurse_params)
        format.html { redirect_to @nurse, notice: 'Nurse account was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @nurse.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: 'Nurse account was successfully destroyed.' }
    end
  end

  def index
    @nurses = Nurse.all
  end

  def show
    @visits = @nurse.visits
  end

  private
    def set_nurse
      @nurse = Nurse.find(params[:id])
    end

    def nurse_params
      params.require(:nurse).permit(
        :first_name,
        :last_name,
        :role
      )
    end

end
