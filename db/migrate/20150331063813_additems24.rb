class Additems24 < ActiveRecord::Migration
  def change
    remove_column :userinputs, :videoin_c0_mode0_nresolution, :string
    remove_column :userinputs, :videoin_c0_mode1_nresolution, :string
    remove_column :userinputs, :videoin_c0_mode2_nresolution, :string
    add_column :userinputs, :videoin_c0_mode0_nresolution, :integer
    add_column :userinputs, :videoin_c0_mode1_nresolution, :integer
    add_column :userinputs, :videoin_c0_mode2_nresolution, :integer
  end
end
