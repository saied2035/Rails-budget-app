class CatagoriesPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :catagories_payments, :id => false do |t|
      t.references :catagory, foreign_key: true
      t.references :payment, foreign_key:true
    end
  end
end
