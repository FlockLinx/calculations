defmodule Calculations.Codewars.RockPaperScissors do
  @moves [:rock, :paper, :scissors]

  @rules %{rock: :scissors, paper: :rock, scissors: :paper}

  def play(move1, move2) when move1 == move2, do: :draw

  def play(move1, move2) do
    if @rules[move1] == move2 do
      :player1_wins
    else
      :player2_wins
    end
  end
end
