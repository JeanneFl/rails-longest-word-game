require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    alphabet = ('A'..'Z').to_a
    10.times do
    @letters << alphabet[rand(0...26)]
    end
  end

  def score
      url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
      words = open(url).read
      api_word = JSON.parse(words)
      @word = api_word["found"]


      @letters = params[:grid]

      @array = params[:word].split('')
      @letters_count = []
      @array.each do |letter|
      @letters_count << (@array.count(letter) <= @letters.count(letter))

      if @letters_count.include?(false)
        @validation = false
      else
        @validation = true
      end
    end
  end
end
