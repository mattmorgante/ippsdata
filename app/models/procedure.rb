class Procedure < ActiveRecord::Base

  filterrific(
  default_settings: { sorted_by: 'drg' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_state
    ]
  )
  scope :with_state, proc { |states| 
    where(state: [*states])
  }

  self.per_page = 50 
  
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Procedure.create! row.to_hash 
    end 
  end 
end
