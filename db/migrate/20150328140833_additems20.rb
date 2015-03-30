class Additems20 < ActiveRecord::Migration
  def change
        remove_column :userinputs, :videoin_c0_mode0_nresolution, :string
        remove_column :userinputs, :videoin_c0_mode1_nresolution, :string
        remove_column :userinputs, :videoin_c0_mode2_nresolution, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_0, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_1, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_2, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_3, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_4, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_5, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_6, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_7, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_8, :string
        add_column :userinputs, :videoin_c0_mode0_nresolution_9, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_0, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_1, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_2, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_3, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_4, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_5, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_6, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_7, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_8, :string
        add_column :userinputs, :videoin_c0_mode1_nresolution_9, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_0, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_1, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_2, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_3, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_4, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_5, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_6, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_7, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_8, :string
        add_column :userinputs, :videoin_c0_mode2_nresolution_9, :string
  end
end
