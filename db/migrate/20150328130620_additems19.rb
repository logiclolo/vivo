class Additems19 < ActiveRecord::Migration
  def change
        add_column :userinputs, :videoin_c0_mode0_maxframerate, :string
        add_column :userinputs, :videoin_c0_mode1_maxframerate, :string
        add_column :userinputs, :videoin_c0_mode2_maxframerate, :string
  end
end
