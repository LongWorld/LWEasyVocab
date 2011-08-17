class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.integer :source_phrase_id
      t.integer :target_phrase_id

      t.timestamps
    end
  end

  def self.down
    drop_table :translations
  end
end
