module GamesHelper
  def add_to_favorites_status_bar(game)
    if current_user.favorite_games.include?(game)
      link_to("Remove from Favorites", remove_favorites_game_path(game))
    else
      link_to("Add to Favorites", add_favorites_game_path(game))
    end
  end
end
