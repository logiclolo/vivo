class Additems31 < ActiveRecord::Migration
  def change
    add_column :userinputs, :videoin_c0_mode0_defaultsetting_s0_resolution, :string
    add_column :userinputs, :videoin_c0_mode0_defaultsetting_s1_resolution, :string
    add_column :userinputs, :videoin_c0_mode0_defaultsetting_s2_resolution, :string
    add_column :userinputs, :videoin_c0_mode0_defaultsetting_s3_resolution, :string
    add_column :userinputs, :videoin_c0_mode1_defaultsetting_s0_resolution, :string
    add_column :userinputs, :videoin_c0_mode1_defaultsetting_s1_resolution, :string
    add_column :userinputs, :videoin_c0_mode1_defaultsetting_s2_resolution, :string
    add_column :userinputs, :videoin_c0_mode1_defaultsetting_s3_resolution, :string
    add_column :userinputs, :videoin_c0_mode2_defaultsetting_s0_resolution, :string
    add_column :userinputs, :videoin_c0_mode2_defaultsetting_s1_resolution, :string
    add_column :userinputs, :videoin_c0_mode2_defaultsetting_s2_resolution, :string
    add_column :userinputs, :videoin_c0_mode2_defaultsetting_s3_resolution, :string
  end
end
