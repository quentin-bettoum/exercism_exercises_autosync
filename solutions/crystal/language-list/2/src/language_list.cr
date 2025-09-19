module LanguageList
  extend self

  def list
    [] of String
  end

  def add(list, language)
    list << language
  end

  def remove(list)
    list.pop && list
  end

  def at(list, index)
    list[index]
  end

  def parse(languages)
    # languages.split(", ")
    languages.split(",").map(&.strip)
  end
end
