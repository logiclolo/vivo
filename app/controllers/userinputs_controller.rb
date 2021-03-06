class UserinputsController < ApplicationController
  before_action :find_vivocamera
  def new
     @userinput = @vivocamera.userinputs.build
  end
  
  def index
  @userinputs = @vivocamera.userinputs
  end

  def create
     
     @userinput = @vivocamera.userinputs.build(userinput_params)
     
      
    if @userinput.save
       flash[:success] = "IP camera property successful created!"
    redirect_to :action => :index
    else
    render :action => :new
    end
  end
  
  def show
    @userinput = Userinput.find(params[:id])
  end

  private

  def find_vivocamera
    @vivocamera = Vivocamera.find( params[:vivocamera_id] )
  end

  
  
  
  
   def userinput_params
     params.require(:userinput).permit(:bootuptim,
                                       :ir,
                                       :extir,
                                       :npir,
                                       :ndi,
                                       :nvi )
   end
  
  
  
  
  
end
