class Additems32 < ActiveRecord::Migration
  def change
    add_column :userinputs, :videoin_c0_mode0_defaultsetting_s0_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode0_defaultsetting_s1_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode0_defaultsetting_s2_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode0_defaultsetting_s3_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode1_defaultsetting_s0_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode1_defaultsetting_s1_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode1_defaultsetting_s2_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode1_defaultsetting_s3_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode2_defaultsetting_s0_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode2_defaultsetting_s1_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode2_defaultsetting_s2_mpeg4_framerate, :string
    add_column :userinputs, :videoin_c0_mode2_defaultsetting_s3_mpeg4_framerate, :string
  end
end
