class TypesController < ApplicationController

  #Getting all type of transaction
	def index
		@types = Type.all
	end

  #Fiding type of transaction to update
	def edit
		@type = Type.find_by(id: params[:id])
	end


  #Updating one type of transaction
	def update 
		@type = Type.find_by(id: params[:id])
		if  @type.update(name: params[:type][:name])
			flash[:notice] =  'Type of transaction was successfully updated.'
		else
			flash[:notice] =  'Something when wrong'
		end
	end

  #Generating new object of type of transaction
	def new
		@type = Type.new 
	end

  #Creating new type of transaction
	def create
    @type = Type.new(name: params[:type][:name])
    if @type.save
      flash[:notice] =  'Type of transaction was successfully updated.'
    else
      flash[:notice] =  'Something when wrong'
    end
	end

  
  #Deleting method
	def destroy
		@result = Type.destroy(params[:id])
		if @result
			@types = Type.all
			flash[:notice] =  "Type  #{@result.name}  was successfully deleted."
		else
			flash[:notice] =  'Something when wrong'
		end
	end
end
