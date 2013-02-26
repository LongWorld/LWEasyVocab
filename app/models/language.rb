class Language < ActiveRecord::Base
  has_many :phrases
  has_many :words
  
  def self.identify(query_string)
    # DH: Adding a ! provides a useful error message if no records are found by ActiveRecord when the DB needs seeding...
    Language.find_by_name!(query_string.to_s.camelcase)
  end
end
