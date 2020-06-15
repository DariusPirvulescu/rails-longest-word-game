require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    alfab = "A".upto("Z").to_a
    @letters = 10.times.map { alfab.sample }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"

    lw_dict = JSON.parse(open(url).read)
    @engl = lw_dict["found"]
    @word_upp = params[:word].upcase.split("")
    @letters = params[:letters].chars.filter { |char| char != " " }
    @incl = @word_upp.all? { |e| @word_upp.count(e) <= @letters.count(e) }
  end
end
