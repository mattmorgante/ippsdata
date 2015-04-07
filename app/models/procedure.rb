class Procedure < ActiveRecord::Base

  filterrific(
  defailt_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :with_average_charges,
      :with_state,
      :with_drg
    ]
  )
  scope :with_state, lambda { |states| 
    where(state: [*states])
  }
  scope :with_drg, lambda { |drgs|
    where(drg: [*drgs])
  }

  self.per_page = 51
  

  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'drg_asc'],
      ['Most Expensive', 'average_charges_desc'],
      ['Least Expensive', 'average_charges_asc'],
    ]
  end

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Procedure.create! row.to_hash 
    end 
  end 
end
