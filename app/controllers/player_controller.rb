require 'json'
require 'net/http'
require 'uri'

class PlayerController < ApplicationController
  def index
  end

  def recent
    @player_id = params[:player_id]
    uri = Dota2Stats::Application::STEAM_MATCH_URL #+ '&account_id=' + player_id
    uri = uri + '&matches_requested=5'
    
    if @player_id
        uri = uri + '&account_id=' + @player_id
    end

    uri = URI.parse(uri)

    response = Net::HTTP.get_response(uri)

    matches = JSON.parse(response.body)['result']['matches']


    # no matches found for this player id = player doesn't exist or is 
    # anonymous. Raise 404 page.
    if not matches
        raise ActionController::RoutingError.new('Player Not Found')
    end

    @matches = []

    matches.each do |match|
        m = {
            :id => match['match_id'],
            :start => match['start_time'],
            :lobby => match['lobby_type'],
            :radiant => [],
            :dire => []
        }

        match['players'].each do |player|
            if player['player_slot'] < 100
                m[:radiant].push(player)
            else
                m[:dire].push(player)
            end
        end

        @matches.push(m)
    end
  end

  # def overview
  #   @player_id = params[:player_id]
  #   uri = Dota2Stats::Application::STEAM_MATCH_URL #+ '&account_id=' + player_id
  #   uri = URI.parse(uri)

  #   response = Net::HTTP.get_response(uri)
  #   matches = JSON.parse(response.body)['result']['matches']
  # end
end
