class VivocameraUserinputsController < ApplicationController

   require 'vivocommon'
   before_action :find_vivocamera , only: [:new,:create, :show]

  def new
    @userinput = @vivocamera.userinputs.build
    #@userinput2 = Userinput.all.find(params[:importid])
    @userinput2 = Userinput.find_by vivocamera_id:params[:importid]
    Userinput.column_names.each{|c| @userinput[:"#{c}"]=@userinput2[:"#{c}"]}
  end
  
  def show
    #@userinputs = @vivocamera.userinput
    @vivocamera = Vivocamera.find( params[:vivocamera_id] )
    @userinput = Userinput.all.find(params[:vivocamera_id])
  end
  
  def index
    @userinputs = @vivocamera.userinputs
  end

  def create
     
     @userinput = @vivocamera.userinputs.build(userinput_params)
     #@userinput = @vivocamera.userinputs.build(params)
     
     #@my_obj = ::Mymodule.new(@userinput)
     @my_obj2 = ::Vivocommon.new(@userinput, @vivocamera.name, @vivocamera.id)
     
    if @userinput.save
       flash[:success] = "IP camera property successful created! #{@vivocamera.id} #{@vivocamera.name}"
    redirect_to  cameraindex_path
    else
    render :action => :new
    end
  end
  
  def edit
     #@vivocamera = Vivocamera.find( params[:vivocamera_id] )
    #@userinput = @vivocamera.userinputs.find(params[:vivocamera_id])

    @vivocamera = Vivocamera.find( params[:vivocamera_id] )
    #@userinput = Userinput.all.find(params[:vivocamera_id])    
    @userinput = Userinput.find_by vivocamera_id:params[:vivocamera_id]
    
  end

  def update
       @vivocamera = Vivocamera.find( params[:vivocamera_id] )
     #@userinput = @vivocamera.userinputs.find( params[:vivocamera_id] )
     @userinput =  @vivocamera.userinputs.find_by vivocamera_id:params[:vivocamera_id]

     @userinput.update_attributes(userinput_params)
      flash[:success] = "IPcamera properties updated!"
      @my_obj2 = ::Vivocommon.new(@userinput, @vivocamera.name, @vivocamera.id)
      redirect_to cameraindex_path
    

  end

  def destroy
      @vivocamera = Vivocamera.find(params[:vivocamera_id])
      @vivocamera.destroy
      @genFolder_sub ="#{@vivocamera.name}_#{@vivocamera.id}"
      @delete_folder = Rails.root + "downloads/" + @genFolder_sub
      @delete_file = Rails.root + "downloads/" + "#{@genFolder_sub}.tar.gz"
      @command = "rm -rf #{@delete_folder} && rm -rf #{@delete_file}"
      system(@command)
      redirect_to cameraindex_path
  end

  private
  
        def find_vivocamera
            @vivocamera = Vivocamera.find( params[:vivocamera_id] )
        end
  
        def userinput_params
         #   params.require(:userinput).permit!
         #params.require(:userinput).permit(:bootuptime,
         #                                  :extir,
         #                                  :npir,
         #                                  :ndi,
         #                                  :nvi,
         #                                  :ndo,
         #                                  :tampering)
         
         params.require(:userinput).permit(Userinput.column_names)
        end
  
  
end
