class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.belongs_to :song
      t.string :sound_type
      t.string :location

      t.timestamps
    end
  end
end
