module Library
  extend self

  def first_letter(title : String) : Char
    title[0]
  end

  def initials(first_name : String, last_name : String) : String
    first_name[0] + "." + last_name[0]
  end

  def decrypt_character(character : Char) : Char
    case character
    when .== 'a'
      'z'
    when .== 'A'
      'Z'
    else
      character.pred
    end
  end

  def decrypt_text(text : String) : String
    text.chars.map{ |c| c.letter? ? decrypt_character(c) : c }.join
  end
end
