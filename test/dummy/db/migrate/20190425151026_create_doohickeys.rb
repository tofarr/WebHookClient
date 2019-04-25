class CreateDoohickeys < ActiveRecord::Migration[5.2]
  def change
    create_table :doohickeys do |t|
      t.string :title

      t.timestamps
    end
  end
end
