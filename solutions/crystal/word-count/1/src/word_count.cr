module WordCount
  def self.count_words(sentence : String) : Hash(String, Int32)
    sentence
      .downcase
      .scan(/\b[\w']+\b/)
      .map(&.[0])
      .tally
  end
end
