class CreateComponentisations < ActiveRecord::Migration
  def self.up
    create_table :componentisations do |t|
      t.integer :word_id
      t.integer :phrase_id

      t.timestamps
    end
  end

  def self.down
    drop_table :componentisations
  end
end
