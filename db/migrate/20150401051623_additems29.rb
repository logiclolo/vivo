class Additems29 < ActiveRecord::Migration
  def change
    add_column :userinputs, :eptz_c0_mode0_s0_support, :integer
    add_column :userinputs, :eptz_c0_mode0_s1_support, :integer
    add_column :userinputs, :eptz_c0_mode0_s2_support, :integer
    add_column :userinputs, :eptz_c0_mode0_s3_support, :integer
    add_column :userinputs, :eptz_c0_mode1_s0_support, :integer
    add_column :userinputs, :eptz_c0_mode1_s1_support, :integer
    add_column :userinputs, :eptz_c0_mode1_s2_support, :integer
    add_column :userinputs, :eptz_c0_mode1_s3_support, :integer
    add_column :userinputs, :eptz_c0_mode2_s0_support, :integer
    add_column :userinputs, :eptz_c0_mode2_s1_support, :integer
    add_column :userinputs, :eptz_c0_mode2_s2_support, :integer
    add_column :userinputs, :eptz_c0_mode2_s3_support, :integer
  end
end
