class Procedure < ActiveRecord::Base
  belongs_to :country

  filterrific(
  available_filters: [
    :with_state
  ]
)
  scope :with_country_id, lambda { |country_ids|
  where(country_id: [*country_ids])
}

  self.per_page = 50 
  
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Procedure.create! row.to_hash 
    end 
  end 
end
