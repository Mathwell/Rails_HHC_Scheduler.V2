class AidsController < ApplicationController
  before_action :set_aid, only: [:show, :edit, :update, :destroy]

  def new
    @aid=Aid.new
  end

  def create
    @aid = Aid.new(aid_params)
    respond_to do |format|
      #raise @nurse.inspect
      if @aid.save
        format.html { redirect_to @aid, notice: 'New aid account was successfully created.' }
        #raise @nurse.inspect
      else

        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @aids=Nurse.where(role: "HHA")
  end

  def show
    @visits = @aid.visits
  end

  private

    def set_aid
      @aid = Aid.find(params[:id])
    end

    def aid_params
      params.require(:aid).permit(
        :first_name,
        :last_name

      )
    end

end
