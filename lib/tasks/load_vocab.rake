task :load_vocab => :environment do
    puts "Loading our Vocabulary Data and their Translations"
    
    counter = 0
    File.open("test/family_words.txt", "r") do |infile|
        while (line = infile.gets)
    #      puts "#{counter}: #{line}"
    #      counter = counter + 1
            if (!line.blank?) then
                translations = line.split('|')
                puts "English: #{translations[0]}, Spanish: #{translations[1]}, French: #{translations[2]}"

                english_words = Array.new
                spanish_words = Array.new
                french_words = Array.new
                
                # Compile our dictionary.
                english_words = Phrase.add(translations[0], :english)
                puts "Added: #{english_words.count} word(s)"
                spanish_words = Phrase.add(translations[1], :spanish)
                puts "Added: #{spanish_words.count} word(s)"
                french_words = Phrase.add(translations[2], :french)
                puts "Added: #{french_words.count} word(s)"

                # Construct our translations.
                Translation.add(english_words, spanish_words)
                Translation.add(spanish_words, english_words)

                Translation.add(english_words, french_words)
                Translation.add(french_words, english_words)
            
                Translation.add(french_words, spanish_words)
                Translation.add(spanish_words, french_words)
            end
        end
    end
end