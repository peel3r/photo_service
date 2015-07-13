class PhotoSearchesController < ApplicationController

  def new
    @search = PhotoSearch.new
  end

  def create

    @search = PhotoSearch.new(image_params[:stock_ref], image_params[:registration])
    if @search.valid?
      redirect_to photo_searches_path(:ref => @search.obfuscated_ref)
    else

      render :action => 'new'
    end
  end


  def index
    @search = PhotoSearch.new(params[:ref])
  end



  def image_params
    params.require(:photo_search).permit(:stock_ref, :registration)
  end

end