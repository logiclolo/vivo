class AddNewitems14 < ActiveRecord::Migration
  def change
    add_column :userinputs, :videoout_codec, :string 
    add_column :userinputs, :protocol_https, :integer 
    add_column :userinputs, :protocol_rtsp, :integer 
    add_column :userinputs, :protocol_sip, :integer 
    add_column :userinputs, :protocol_maxconnection, :integer 
    add_column :userinputs, :protocol_maxgenconnection, :integer 
    add_column :userinputs, :protocol_rtp_multicast_scalable, :integer 
    add_column :userinputs, :protocol_rtp_multicast_backchannel, :integer 
    add_column :userinputs, :protocol_rtp_tcp, :integer 
    add_column :userinputs, :protocol_rtp_http, :integer 
    add_column :userinputs, :protocol_spush_mjpeg, :integer 
    add_column :userinputs, :protocol_snmp, :integer 
    add_column :userinputs, :protocol_ipv6, :integer 
    add_column :userinputs, :protocol_pppoe, :integer 
    add_column :userinputs, :protocol_ieee8021x, :integer 
    add_column :userinputs, :protocol_qos_cos, :integer 
    add_column :userinputs, :protocol_qos_dscp, :integer 
    add_column :userinputs, :protocol_ddns, :integer 
    add_column :userinputs, :protocol_timeshift, :integer 
    add_column :userinputs, :uart_httptunnel, :integer 
    add_column :userinputs, :transmission_mode, :integer 
    add_column :userinputs, :storage_dbenabled, :integer 
    add_column :userinputs, :derivative_brand, :integer 
    add_column :userinputs, :test_ac, :integer 
    add_column :userinputs, :media_totalspace, :integer 
    add_column :userinputs, :media_snapshot_sizepersecond, :integer 
    add_column :userinputs, :media_snapshot_maxpreevent, :integer 
    add_column :userinputs, :media_snapshot_maxpostevent, :integer 
    add_column :userinputs, :media_snapshot_maxsize, :integer 
    add_column :userinputs, :media_videoclip_maxsize, :integer 
    add_column :userinputs, :media_videoclip_maxlength, :integer 
    add_column :userinputs, :media_videoclip_maxpreevent, :integer 
    add_column :userinputs, :remotecamctrl_slave, :integer 
    add_column :userinputs, :remotecamctrl_master, :integer 
  end
end
