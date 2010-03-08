class GamesController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :create, :update, :destroy, :add_favorites, :remove_favorites]
  before_filter :find_game, :only =>  [:edit, :update, :destroy, :add_favorites, :remove_favorites]

  def index
    @games = Game.recent.paginate( :page => params[:page], :per_page => 5)
    @page_title = "Game List"
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(params[:game])
    if @game.save
      notice_stickie('Game was successfully created.')
      redirect_to game_path(@game)
    else
      render :action => "new"
    end
  end

  def update
    if @game.update_attributes(params[:game])
      notice_stickie('Game was successfully updated.')
      redirect_to game_path(@game)
    else
      format.html {render :action => "edit"}
    end
  end

  def add_favorites
    current_user.favorite_games << @game
    notice_stickie('Game was successfully add to favorite.')
    redirect_to games_path
  end
   
  def remove_favorites
    # current_user.remove_favorites(game)
    favorite = current_user.favorites.find_by_user_id_and_game_id(current_user, @game.id)
    favorite.destroy
    warning_stickie('Game was successfully remove from favorite.')
    redirect_to games_path   
  end
  
  def add_tags
    @game.tag_list.add("s")
  end
  
  def remove_tags
    @game.tag_list.remove("s")
  end
  
  def destroy
    @game.destroy
    warning_stickie('Game was successfully remove.')
    redirect_to games_path
  end

  protected
  def find_game
    @game = Game.find(params[:id])    
  end
end
