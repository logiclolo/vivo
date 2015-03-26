class AddNewitems9 < ActiveRecord::Migration
  def change
    add_column :userinputs, :vadp_supportfeature_bit0, :integer
    add_column :userinputs, :vadp_supportfeature_bit1, :integer
    add_column :userinputs, :vadp_supportfeature_bit2, :integer
    add_column :userinputs, :vadp_supportfeature_bit3, :integer  
    add_column :userinputs, :vadp_supportfeature_bit4, :integer
    add_column :userinputs, :vadp_supportfeature_bit5, :integer
    add_column :userinputs, :vadp_supportfeature_bit6, :integer
    add_column :userinputs, :vadp_supportfeature_bit7, :integer 
    add_column :userinputs, :vadp_npackage, :integer 
  end
end
