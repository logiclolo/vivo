class AddNewitems13 < ActiveRecord::Migration
  def change
        add_column :userinputs, :network_wire, :integer 
        add_column :userinputs, :network_wireless, :integer 
        add_column :userinputs, :wireless_s802dot11b, :integer 
        add_column :userinputs, :wireless_s802dot11g, :integer 
        add_column :userinputs, :wireless_s802dot11n, :integer 
        add_column :userinputs, :wireless_encrypt_wep, :integer 
        add_column :userinputs, :wireless_encrypt_wpa, :integer 
        add_column :userinputs, :wireless_encrypt_wpa2, :integer 
        add_column :userinputs, :wireless_beginchannel, :integer 
        add_column :userinputs, :wireless_endchannel, :integer 
  end
end
