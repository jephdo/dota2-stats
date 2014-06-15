require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dota2Stats
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    STEAM_API_KEY = 'E5DAEA335681A46421D8EE7FF175E4BD'

    Dota.configure do |config|
        config.api_key = STEAM_API_KEY
    end

    STEAM_MATCH_URL = 'https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=' + STEAM_API_KEY
    STEAM_MATCH_DETAIL = 'https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=' + STEAM_API_KEY
  
    PLAYER_COLORS = {
        0 => 'Blue',
        1 => 'Teal',
        2 => 'Purple',
        3 => 'Yellow',
        4 => 'Orange',
        128 => 'Pink',
        129 => 'Grey',
        130 => 'Light Blue',
        131 => 'Green',
        132 => 'Brown'
    }
    
    HEROES = {
                 1 => "Anti-Mage",
                 2 => "Axe",
                 3 => "Bane",
                 4 => "Bloodseeker",
                 5 => "Crystal Maiden",
                 6 => "Drow Ranger",
                 7 => "Earthshaker",
                 8 => "Juggernaut",
                 9 => "Mirana",
                 11 => "Shadow Fiend",
                 10 => "Morphling",
                 12 => "Phantom Lancer",
                 13 => "Puck",
                 14 => "Pudge",
                 15 => "Razor",
                 16 => "Sand King",
                 17 => "Storm Spirit",
                 18 => "Sven",
                 19 => "Tiny",
                 20 => "Vengeful Spirit",
                 21 => "Windrunner",
                 22 => "Zeus",
                 23 => "Kunkka",
                 25 => "Lina",
                 31 => "Lich",
                 26 => "Lion",
                 27 => "Shadow Shaman",
                 28 => "Slardar",
                 29 => "Tidehunter",
                 30 => "Witch Doctor",
                 32 => "Riki",
                 33 => "Enigma",
                 34 => "Tinker",
                 35 => "Sniper",
                 36 => "Necrolyte",
                 37 => "Warlock",
                 38 => "Beastmaster",
                 39 => "Queen of Pain",
                 40 => "Venomancer",
                 41 => "Faceless Void",
                 42 => "Skeleton King",
                 43 => "Death Prophet",
                 44 => "Phantom Assassin",
                 45 => "Pugna",
                 46 => "Templar Assassin",
                 47 => "Viper",
                 48 => "Luna",
                 49 => "Dragon Knight",
                 50 => "Dazzle",
                 51 => "Clockwerk",
                 52 => "Leshrac",
                 53 => "Nature's Prophet",
                 54 => "Lifestealer",
                 55 => "Dark Seer",
                 56 => "Clinkz",
                 57 => "Omniknight",
                 58 => "Enchantress",
                 59 => "Huskar",
                 60 => "Night Stalker",
                 61 => "Broodmother",
                 62 => "Bounty Hunter",
                 63 => "Weaver",
                 64 => "Jakiro",
                 65 => "Batrider",
                 66 => "Chen",
                 67 => "Spectre",
                 69 => "Doom",
                 68 => "Ancient Apparition",
                 70 => "Ursa",
                 71 => "Spirit Breaker",
                 72 => "Gyrocopter",
                 73 => "Alchemist",
                 74 => "Invoker",
                 75 => "Silencer",
                 76 => "Outworld Devourer",
                 77 => "Lycanthrope",
                 78 => "Brewmaster",
                 79 => "Shadow Demon",
                 80 => "Lone Druid",
                 81 => "Chaos Knight",
                 82 => "Meepo",
                 83 => "Treant Protector",
                 84 => "Ogre Magi",
                 85 => "Undying",
                 86 => "Rubick",
                 87 => "Disruptor",
                 88 => "Nyx Assassin",
                 89 => "Naga Siren",
                 90 => "Keeper of the Light",
                 91 => "Wisp",
                 92 => "Visage",
                 93 => "Slark",
                 94 => "Medusa",
                 95 => "Troll Warlord",
                 96 => "Centaur Warrunner",
                 97 => "Magnus",
                 98 => "Timbersaw",
                 99 => "Bristlebog",
                 100 => "Tusk",
                 101 => "Skywrath Mage",
                 102 => "Abaddon",
                 103 => "Elder Titan",
                 104 => "Legion Commander",
                 106 => "Ember Spirit",
                 107 => "Earth Spirit",
                 108 => "Abyssal Underlord",
                 109 => "Terrorblade",
                 110 => "Phoenix"
                }.freeze
  end
end
