# Exercise
#
#  Fill out the code and spec according to the requirements.
#
#  Requirements: http://codingdojo.org/cgi-bin/wiki.pl?KataTennis
#
require_relative '03_tennis_kata'
require 'minitest/autorun'

describe TennisGame do

  it "score the start of the game" do
    game = TennisGame.new
    game.score.must_equal "Love All"
  end

end

