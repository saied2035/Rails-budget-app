class PaymentsCatagories < ActiveRecord::Migration[7.0]
  def change
    create_table :payments_catagories, :id => false do |t|
      t.references :payment, foreign_key:true
      t.references :catagory, foreign_key: true
    end
  end
end
