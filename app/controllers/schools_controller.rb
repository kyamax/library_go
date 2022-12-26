class SchoolsController < ApplicationController
  def new
    gon.prefectures = Prefecture.all.to_json only: %i[id name]
  end

  def create
  end
  
end
