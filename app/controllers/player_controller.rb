class PlayerController < ApplicationController
  def overview
    id = params[:player_id]

    @matches = Dota.history(account_id:id).matches

  end
end
