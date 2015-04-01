class Additems22 < ActiveRecord::Migration
  def change
    remove_column :userinputs, :h265, :string
    remove_column :userinputs, :h264, :string
    remove_column :userinputs, :mjpeg, :string
    add_column :userinputs, :h265, :integer
    add_column :userinputs, :h264, :integer
    add_column :userinputs, :mjpeg, :integer
    add_column :userinputs, :mpeg4, :integer
    add_column :userinputs, :image_c0_wdrpro, :integer
    add_column :userinputs, :image_c0_wdrpro_str, :integer
    add_column :userinputs, :image_c0_wdrc, :integer
    add_column :userinputs, :image_c0_lens_type, :string
    add_column :userinputs, :image_c0_flickerless, :integer
    add_column :userinputs, :image_c0_defog, :integer
    add_column :userinputs, :image_c0_aespeed, :integer
    add_column :userinputs, :image_c0_scene_mode, :integer
  end
end
