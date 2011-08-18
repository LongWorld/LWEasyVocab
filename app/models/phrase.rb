class Phrase < ActiveRecord::Base
  has_many :translations
  has_many :phrases, :through => :translations
  
  belongs_to :language
  has_many :componentisations 
  
  def self.search(search)
    if search
      where('text LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def self.add(str, language)
    # Initialise array to return.
    ret = Array.new
    
    # Identify the Language we are using first.
    lang = Language.identify(language)
    
    if (!str.blank?)
      # See if we can split the string.
      str.split('/').each do |phrase|
        ret << Phrase.find_or_create_by_text_and_language_id(:text => phrase, :language_id => lang.id)
        Word.add(phrase, lang.id)
      end
    end
    
    return ret
  end
end
