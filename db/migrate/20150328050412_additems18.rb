class Additems18 < ActiveRecord::Migration
  def change
        add_column :userinputs, :videoin_c0_mode0_nresolution, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution, :string
  end
end
