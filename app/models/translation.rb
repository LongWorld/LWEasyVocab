class Translation < ActiveRecord::Base
  belongs_to :source_phrase, :class_name => "Phrase"
  belongs_to :target_phrase, :class_name => "Phrase"
  
  def self.add(text_from, text_to)
    puts "Translation::add(#{text_from.count}, #{text_to.count})"
    text_from.each do |source|
      text_to.each do |target|
        puts "#{source.text} -> #{target.text}"
        Translation.find_or_create_by_source_phrase_id_and_target_phrase_id(:source_phrase => source, :target_phrase => target)
      end
    end

    text_to.each do |source|
      text_from.each do |target|
        puts "#{source.text} -> #{target.text}"
        Translation.find_or_create_by_source_phrase_id_and_target_phrase_id(:source_phrase => source, :target_phrase => target)
      end
    end
  end
end
