class ProceduresController < ApplicationController
  # def index
  #   @procedures = Procedure.all
  #   # @procedures = Procedure.procedure_name("039")
  # end

  def index
    @filterrific = initialize_filterrific(
      Procedure,
      params[:filterrific],
      select_options: { 
      price: Procedure.with_average_charges
    },
    ) 
    return
    @procedures = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @procedure = Procedure.find(params[:id])
    # @procedure = Procedure.procedure_name("039")
  end 

  def new
    
  end

  def import
    Procedure.import(params[:file])
    redirect_to root_url, notice: "Data imported"
  end
end
