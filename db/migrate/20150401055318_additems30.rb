class Additems30 < ActiveRecord::Migration
  def change
    add_column :userinputs, :videoin_c0_h265_maxbitrate, :string
    add_column :userinputs, :videoin_c0_h264_maxbitrate, :string
    add_column :userinputs, :videoin_c0_mjpeg_maxbitrate, :string
    add_column :userinputs, :videoin_c0_mpeg4_maxbitrate, :string
  end
end
