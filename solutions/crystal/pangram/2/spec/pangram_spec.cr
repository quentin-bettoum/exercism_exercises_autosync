require "spec"
require "../src/*"

describe "Pangram" do
  it "empty sentence" do
    Pangram.pangram?("").should be_false
  end

  pending "perfect lower case" do
    Pangram.pangram?("abcdefghijklmnopqrstuvwxyz").should be_true
  end

  pending "only lower case" do
    Pangram.pangram?("the quick brown fox jumps over the lazy dog").should be_true
  end

  pending "missing the letter 'x'" do
    Pangram.pangram?("a quick movement of the enemy will jeopardize five gunboats").should be_false
  end

  pending "missing the letter 'h'" do
    Pangram.pangram?("five boxing wizards jump quickly at it").should be_false
  end

  pending "with underscores" do
    Pangram.pangram?("the_quick_brown_fox_jumps_over_the_lazy_dog").should be_true
  end

  pending "with numbers" do
    Pangram.pangram?("the 1 quick brown fox jumps over the 2 lazy dogs").should be_true
  end

  pending "missing letters replaced by numbers" do
    Pangram.pangram?("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog").should be_false
  end

  pending "mixed case and punctuation" do
    Pangram.pangram?("\"Five quacking Zephyrs jolt my wax bed.\"").should be_true
  end

  pending "a-m and A-M are 26 different characters but not a pangram" do
    Pangram.pangram?("abcdefghijklm ABCDEFGHIJKLM").should be_false
  end
end
