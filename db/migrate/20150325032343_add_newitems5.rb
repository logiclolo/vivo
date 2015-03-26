class AddNewitems5 < ActiveRecord::Migration
  def change
    add_column :userinputs, :audio_aec, :integer
    add_column :userinputs, :audio_intmic, :integer
    add_column :userinputs, :audio_extmic, :integer
    add_column :userinputs, :audio_lineout, :integer
    add_column :userinputs, :audio_michardwareswitch, :integer
    add_column :userinputs, :audioin_codec_aac4, :integer
    add_column :userinputs, :audioin_codec_g711, :integer
    add_column :userinputs, :audioin_codec_g726, :integer
    add_column :userinputs, :audioout_codec_g711, :integer
  end
end
