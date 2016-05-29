class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :number
      t.string :currency
      t.integer :balance

      t.references :user, :foreign_key => { :on_delete => :cascade }

      t.timestamps null: false
    end
  end
end
