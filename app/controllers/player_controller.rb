require 'json'
require 'net/http'
require 'uri'

class PlayerController < ApplicationController
  def overview
    player_id = params[:player_id]
    uri = Dota2Stats::Application::STEAM_MATCH_URL #+ '&account_id=' + player_id
    uri = URI.parse(uri)

    response = Net::HTTP.get_response(uri)

    matches = JSON.parse(response.body)['result']['matches']

    @matches = []

    matches.each do |match|
        m = {
            :id => match['match_id'],
            :start => match['start'],
            :lobby => match['lobby'],
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

end