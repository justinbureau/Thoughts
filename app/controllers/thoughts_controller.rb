class ThoughtsController < ApplicationController	

	def index
		@thought = Thought.new
		@thoughts = Thought.order(created_at: :desc).all
	end

	def show 
		@thought = Thought.find(params[:id])
	end

	def edit
		@thought = Thought.find(params[:id])
	end

	def update
		@thought = Thought.find(params[:id])
		if @thought.update_attributes(allowed_params)
			respond_to do |format|
      		format.html { redirect_to thoughts_path, notice: 'Thought was successfully updated.' }
			end
		else
			render 'edit'
		end
	end

	def new
		@thought = Thought.new
	end

	def create
		@thought = Thought.new(allowed_params)
		if @thought.save
			respond_to do |format|
      		format.html { redirect_to thoughts_path, notice: 'Thought was successfully created.' }
			end
		else 
			render 'new'
		end
	end

	def destroy
		@thought = Thought.find(params[:id])
		@thought.destroy
		respond_to do |format|
      		format.html { redirect_to thoughts_path, notice: 'Thought was successfully deleted.' }
      	end
	end

	private 

	def allowed_params
		params.require(:thought).permit(:title, :text, :source)
	end

end
