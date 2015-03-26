class VivocamerasController < ApplicationController


 def show
  @vivocamera=Vivocamera.find(params[:id])
 end

 def new
   @vivocamera=Vivocamera.new
   @vivocameras=Vivocamera.all
 end

 def index
  @vivocameras=Vivocamera.all
 end


  def create
    @vivocamera = Vivocamera.new(vivocamera_params)
     @vivocamera.save
      flash[:success] = "IP camera successful created! #{@vivocamera.id} #{@vivocamera.importid}"
       
       
     redirect_to :controller => :vivocamera_userinputs, :action => :new, :vivocamera_id => @vivocamera.id, :importid=>@vivocamera.importid
  
  end

 def edit
   @vivocamera = Vivocamera.find(params[:vivocamera_id])
 end

 def update
   @vivocamera = Vivocamera.find(params[:id])
   
   @vivocamera.update_attributes(vivocamera_params)
      flash[:success] = "IPcamera name updated!"
      redirect_to cameraindex_path
   
 end
 
 def download
    @filePath = "downloads/#{params[:vivocamera_name]}_#{params[:vivocamera_id]}.tar.gz"
    send_file @filePath, :x_sendfile=>true
 end
  

  private

    def vivocamera_params
      params.require(:vivocamera).permit(:name, :importid)
    end

  

end
