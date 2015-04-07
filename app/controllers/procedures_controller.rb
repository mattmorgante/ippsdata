class ProceduresController < ApplicationController

  def index
    @filterrific = initialize_filterrific(
      Procedure,
      params[:filterrific],
      :select_options => { 
      sorted_by: Procedure.options_for_sorted_by,
      with_state: Procedure.uniq.pluck(:state),
      with_drg: Procedure.uniq.pluck(:drg)
    }

    ) or return
    @procedures = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
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


