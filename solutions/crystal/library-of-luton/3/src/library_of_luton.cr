module Library
  extend self

  def first_letter(title : String) : Char
    title[0]
  end

  def initials(first_name : String, last_name : String) : String
    first_letter(first_name) + "." + first_letter(last_name)
  end

  def decrypt_character(character : Char) : Char
    case character
    when 'a' then 'z'
    when 'A' then 'Z'
    when .ascii_letter? then character.pred
    else character
    end
  end

  def decrypt_text(text : String) : String
    # text.chars.map{ |c| decrypt_character(c) }.join
    text.chars.map(&->decrypt_character(Char)).join
  end
end
