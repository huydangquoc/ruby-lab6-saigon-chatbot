class CreateFlashCards < ActiveRecord::Migration[5.0]
  def change
    create_table :flash_cards do |t|
      t.string :term
      t.string :definition

      t.timestamps
    end
  end
end
