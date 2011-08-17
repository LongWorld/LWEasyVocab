# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
[["English", "GB"], ["French", "FR"], ["Spanish", "ES"]].each do |lang|
  Language.find_or_create_by_name_and_abbreviation(:name => lang[0], :abbreviation => lang[1])
end

['noun','verb','adjective','pronoun','preposition','adverb','conjunction','interfection'].each do |category|
  Category.find_or_create_by_name(:name => category)
end
