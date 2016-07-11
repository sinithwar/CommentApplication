class MainController < ApplicationController
layout :layout_diff
def main
	@comment = Comment.all
end
def new
end
def create
	@comment = Comment.new(comment_params)
  @comment.save
  redirect_to @comment
end
def show
	redirect_to action: 'main'
end
def update
	@comment = Comment.find(params[:id])
	
	if @comment.update(edit_params)
		redirect_to @comment
	else
		redirect_to action: 'main'
	end
end
def edit
	@comment = Comment.find(params[:id])
end
def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy
	redirect_to action: 'main'
end

private
  def comment_params
    params.require(:comments).permit(:name, :comment)
  end
  def edit_params
  	params.require(:comment).permit(:name, :comment)
  end
  
  def layout_diff
  	case action_name
  	when 'edit'
  		'edit'
  	else
  		'comments'
  	end
  end
end
