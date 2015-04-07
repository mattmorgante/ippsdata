class ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
  end

  def import
    Procedure.import(params[:file])
    redirect_to root_url, notice: "Data imported"
  end
end
