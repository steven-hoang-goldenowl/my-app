class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :email_confirmed, default: false
      t.string :confirm_token

      t.timestamps
    end
  end
end
