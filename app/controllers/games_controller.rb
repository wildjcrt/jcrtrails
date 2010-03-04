class GamesController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :find_game, :only =>  [:edit, :update, :destroy]

  def index
    @games = Game.recent.paginate( :page => params[:page], :per_page => 5)
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
      flash[:notice] = 'Game was successfully created.'
      redirect_to game_path(@game)
    else
      render :action => "new"
    end
  end

  def update
    if @game.update_attributes(params[:game])
      flash[:notice] = 'Game was successfully updated.'
      redirect_to game_path(@game)
    else
      format.html {render :action => "edit"}
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  protected
  def find_game
    @game = Game.find(params[:id])    
  end
end
