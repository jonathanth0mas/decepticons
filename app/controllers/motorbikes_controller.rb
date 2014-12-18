class MotorbikesController < ApplicationController
	def index
	  @motorbikes = Motorbike.all
	end


	def show 
	  
	  @motorbike = Motorbike.find(params[:id])	
	end

	def new
	   
	  @motorbike = Motorbike.new	
	end

	def create
	 
	  @motorbike = Motorbike.new(motorbike_params)

	  if @motorbike.save
	    redirect_to motorbikes_path
	  else
	    render "new"
	  end 	
	end

	def edit
	  
	  @motorbike = Motorbike.find(params[:id])	 
	end

	def update
	  @motorbike = Motorbike.find(params[:id])

	  if @motorbike.update_attributes(params.require(:motorbike).permit(:name, :brand, :speed))
	    redirect_to motorbikes_path
	  else
	  	render "edit"
	  end
	end

	def destroy
	  @motorbike =  Motorbike.find(params[:id]) 
	  @motorbike.destroy
	  redirect_to motorbikes_path	
	end

	private

	def motorbike_params
	  params.require(:motorbike).permit(:name, :brand, :speed )
	end

end






end
