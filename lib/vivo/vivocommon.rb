class Vivocommon
  require 'fileutils'
  require 'capability'
  #require 'videoin'
  #require 'audioin'
  #require 'audioout'
  #require 'camctrl'
  #require 'watchlist'
  #require 'customlanguage'
  #require 'ddns'
  #require 'disk'
  #require 'dst'
  #require 'eptz'
  #require 'exposurewindows'
  #require 'expresslink'
  #require 'genetec'
  #require 'https'
  #require 'ieee8021x'
  #require 'image'
  #require 'imagefeature'
  #require 'iod'
  #require 'ipfilter'
  #require 'ircutctrl'
  #require 'language'
  #require 'layout'
  #require 'motion'
  #require 'network'
    


  def initialize(k, id, name)
    
    @genFolder_root ="downloads/"
    @genFolder_sub ="#{id}_#{name}"
    @genFolder = @genFolder_root + @genFolder_sub
    FileUtils.rmdir @genFolder
    FileUtils.mkdir_p @genFolder
    
    Capability.new(k, @genFolder)
    # Videoin.new(k)
    # Audioin.new(k)
    # Audioout.new(k)
    # Camctrl.new(k)
    # Watchlist.new(k)
    # Customlanguage.new(k)
    # Ddns.new(k)
    # Disk.new(k)
    # Dst.new(k)
    # Eptz.new(k)
    # Exposurewindows.new(k)
    # Expresslink.new(k)
    # Genetec.new(k)
    # Https.new(k)
    # Ieee8021x.new(k)
    # Image.new(k)
    # Imagefeature.new(k)
    # Iod.new(k)
    # Ipfilter.new(k)
    # Ircutctrl.new(k)
    # Language.new(k)
    # Layout.new(k)
    # Motion.new(k)
    # Network.new(k)
    # Onvif_devicemgt.new(k)
    # Onvif_media.new(k)
    # Onvif_ptzcontrol.new(k)
    # Onvifd.new(k)
    # Onvifdiscovery.new(k)
    # Privacymask.new(k)
    # Privilege.new(k)
    # Qos.new(k)
    # Seamlessrecording.new(k)
    # Security.new(k)
    # Serverpush.new(k)
    # Shmem.new(k)
    # Smartstream.new(k)
    # Status.new(k)
    # Streamserver.new(k)
    # Syslog.new(k)
    # Systeminfo.new(k)
    # Tampering.new(k)
    # Uart.new(k)
    # Upnpportforwarding.new(k)
     #Vadpinfo.new(k)
     #Videoin.new(k)
     #Videomode_c0.new(k)
     @folder_path = Rails.root + @genFolder_root
     @command = "cd #{@folder_path} && tar zcvf #{@genFolder_sub}.tar.gz #{@genFolder_sub}"
     system(@command)
  end

end
