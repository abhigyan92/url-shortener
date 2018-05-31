class UrlsController < ApplicationController
	def new
		@url = Url.new
	end

	def create
		@url = Url.new(url_params)
    if @url.new_url?
      if @url.save
        redirect_to urls_path
      else
        flash[:error] = "Check the error below:"
        render 'new'
      end
    else
      flash[:notice] = "A short link for this URL is already in our database"
      redirect_to urls_path
    end
	end

	def index
    @urls = Url.all
	end

	def show
	end

	def destroy
    Url.find(params[:id]).destroy
    redirect_to urls_path
	end

  private
    def url_params
      params.require(:url).permit(:original_url)
    end
end
