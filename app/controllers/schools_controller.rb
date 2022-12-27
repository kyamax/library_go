class SchoolsController < ApplicationController
  def new
    gon.prefectures = Prefecture.all.to_json only: %i[id name]
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.valid?
      @school.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def school_params
    params.require(:school).permit(:name).merge(prefecture: params[:prefecture_id], city: params[:city_id])
  end

end
