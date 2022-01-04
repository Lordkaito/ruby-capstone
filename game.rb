require_relative './item'
require 'pry'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date = Time.now)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at > 2)
  end
end

game = Game.new(true, 2015)

game.can_be_archived?
