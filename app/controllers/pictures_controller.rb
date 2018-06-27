class PicturesController < ApplicationController
    before_action :ensure_logged_in, except: [:show, :index]
      # before_action :new_picture, only: [:new, :create]
    # before_action :load_picture, only: [:show, :edit, :update, :destroy]
    # before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]

# run the  mentiond method before executing the code
    def index
        @most_recent_pictures = Picture.most_recent_five
        @pictures_in_year = Picture.pictures_created_in_year(Time.now.year)
        @pictures_from_last_year = Picture.pictures_created_in_year((Time.now - 1.year).year)
        @last_month_pictures = Picture.last_month_pictures(Time.now - 1.month)
    end

    def show
       @picture = Picture.find(params[:id])
     end

     def new
         @picture = Picture.new
     end
     def create
         @picture = Picture.new
         @picture.title = params[:picture][:title]
         @picture.artist = params[:picture][:artist]
         @picture.url = params[:picture][:url]
         @picture.user = current_user
         # User.find(session[:user_id]) session[:user_id]
         if @picture.save
           # if the picture gets saved, generate a get request to "/pictures" (the index)
           redirect_to "/pictures"
         else
           # otherwise render new.html.erb
           render :new
         end
     end
     def edit
         @picture = Picture.find(params[:id])
     end
     def update
        @picture = Picture.find(params[:id])
        @picture.title = params[:picture][:title]
        @picture.artist = params[:picture][:artist]
        @picture.url = params[:picture][:url]
        if @picture.save
            redirect_to "/pictures/#{@picture.id}"
        else
            render :edit
        end
    end
    def destroy
        @picture = Picture.find(params[:id])
        @picture.destroy
        redirect_to "/pictures"
    end
    # def ensure_user_owns_picture
    #   if current_user == nil
    #     flash[:alert] = "Please log in."
    #     redirect_to new_sessions_path
    #   elsif current_user != @picture.user
    #     flash[:alert] = "Sorry, you do not have access to this picture."
    #     redirect_to picture_path
    #   end
    # end
end
