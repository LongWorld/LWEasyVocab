class Language < ActiveRecord::Base
  has_many :phrases
  has_many :words
  
  def self.identify(query_string)
    Language.find_by_name(query_string.to_s.camelcase)
  end
end
