require_relative '../item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(name, multiplayer, last_played_at, publish_date)
    super(name, publish_date)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (DateTime.now.year - Date.parse(@last_played_at).year > 2)
  end
end
