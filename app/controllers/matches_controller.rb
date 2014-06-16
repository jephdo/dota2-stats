require 'json'
require 'net/http'
require 'uri'

class MatchesController < ApplicationController
  def detail
  	if params[:match_id]
		@match_id = params[:match_id]
	else
		@match_id = "27110133"
	end
    url = Dota2Stats::Application::STEAM_MATCH_DETAIL + '&match_id=' + @match_id
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)

    result = JSON.parse(response.body)['result']
    @players = result['players']

    @radiant_win = result['radiant_win']

    @radiant_score = @players.select{|p| p['player_slot'] < 100}.collect{|p| p['kills']}.reduce(:+)
    @dire_score = @players.select{|p| p['player_slot'] > 100}.collect{|p| p['kills']}.reduce(:+)
  end
end
