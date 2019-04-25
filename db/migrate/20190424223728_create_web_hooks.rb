class CreateWebHooks < ActiveRecord::Migration[5.2]
  def change
    create_table :web_hooks do |t|
      t.text :url, null: false
      t.string :method, null: false, limit: 10
      t.string :model_type, null: false, limit: 50, index: true
      t.string :event_type, null: false, limit: 50, index: true
      t.string :auth_type, null: false, limit: 10, default: 'none'
      t.text :auth_params
      t.text :default_params
      t.timestamps
    end
  end
end
