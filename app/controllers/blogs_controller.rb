class BlogsController < ApplicationController
    #index action to show all posts
    def index
        @blogs = Blog.all
    end
    
    #show all blog posts
    def show
        @blog = Blog.find(params[:id])
    end
    
    #create new blog posts
    def create
        @blog = Blog.new(blog_params)
    
        if @blog.save
            message = {notice: "Entry saved" }
        else
            message = {notice: "Entry not saved", errors: @blog.errors.full_messages.to_sentence }
        end
        redirect_to blogs_path, flash: message
    end
    
    #delete blog post
    def destroy
        @blog = Blog.find(params[:id])
        if @blog.destroy
            message = {notice: "Successfully deleted post" }
        else
            message = {notice: "Uanable to delete post" }
        end
        redirect_to blogs_path, flash: message
    end
    
    #edit and update blog post
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            message = {notice: "Successfully updated post" }
            redirect_to blogs_path, flash: message
        else
            render 'edit'
        end
    end
    
    private
    
    def blog_params
        params.require(:blog).permit( :title, :content)
    end
end
