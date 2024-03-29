class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :author, index:true, foreign_key: {to_table: :users}
      t.string :name
      t.numeric :amount
      t.timestamps
    end
  end
end
