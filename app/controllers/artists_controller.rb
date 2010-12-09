class ArtistsController < ApplicationController
  def index
    p "Indexed"
    if params[:query] then 
      
    else
        
      @artists = Song.collection.distinct("artist")
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @songs }
    end
  end
  
  def show
    @song = Song.find(params[:id])
    @titles = Song.where(:song_title => @song.song_title)
    if @titles then
      @title_count = @titles.count
      @artists = @titles.collect {|artist| artist.artist}
      @artists.uniq!
      @artists.delete(@song.artist)
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song }
    end
  end
end
