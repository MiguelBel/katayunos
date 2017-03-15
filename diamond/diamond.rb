def diamond_for(letter)
  if letter == 'A'
    "#{letter}\n"
  elsif letter == 'B'
    builder = DiamondBuilder.new(letter)
    builder.build
  else
    "  A\n B B\n#{letter}   #{letter}\n B B\n  A\n"
  end
end

class DiamondBuilder
  def initialize(letter)
    @letter = letter
  end

  def build
    result = first_half + gap + second_half
    remove_trailing_spaces_from(result) + "\n"
  end

  private

  def first_half
    " A \n#{@letter}"
  end

  def gap
    " "
  end

  def second_half
    first_half.reverse
  end

  def remove_trailing_spaces_from(result)
    result.split("\n").map{ |l| l.rstrip }.join("\n")
  end
end
