class FlashCard < ApplicationRecord
  def self.import_from_quizlet
    require 'net/http'
    # IF YOU HAVE AN API KEY
    # url = URI.parse("https://api.quizlet.com/2.0/sets/44831586?client_id=ENV['QUIZLET_CLIENT_ID']&whitespace=1")
    # You can use the gist link in the notes above instead
    # res = Net::HTTP.get_response(url)
    hash = JSON.parse(File.read('public/quizlet.json'))
    terms = hash["terms"]
    terms.each do |term|
      FlashCard.find_or_create_by(id: term["id"]) do |card|
        card.term = term["term"]
        card.definition = term["definition"]
      end
    end
  end

  def definition_correct?(guess)
    return definition == guess
  end

end
