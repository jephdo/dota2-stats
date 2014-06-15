module PlayerHelper
    def lookup_hero_name(hero_id)
        Dota2Stats::Application::HEROES[hero_id]
    end

    def lookup_player_color(slot_id)
        Dota2Stats::Application::PLAYER_COLORS[slot_id]
    end

end
