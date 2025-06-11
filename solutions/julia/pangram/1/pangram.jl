"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input::String)::Bool
    str = input .|> Base.Unicode.lowercase
    for char in "abcdefghijklmnopqrstuvwxyz"
        if occursin(char, str)
            continue
        end
        return false
    end
    return true
end

