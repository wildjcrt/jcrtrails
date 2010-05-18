module GamesHelper
  def add_to_favorites_status_bar(game)
    if current_user.favorite_games.include?(game)
      return link_to("Remove from Favorites", remove_favorites_game_path(game))
    else
      return link_to("Add to Favorites", add_favorites_game_path(game))
    end
  end
  
  def game_button_in_index(game)
    str = ""
		str += link_to("Show", game_path(game))
	  if current_user
	    str +="" + ' | ' +
  		add_to_favorites_status_bar(game) + ' | ' +
  		link_to("Edit", edit_game_path(game)) + ' | ' +
  		link_to("Delete", game_path(game), :confirm => "Are you sure?", :method => :delete )
	  end  
	  return str
  end  
  
end
