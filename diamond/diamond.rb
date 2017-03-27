def diamond_for(letter)
  builder = DiamondBuilder.new(letter)
  builder.build
end

class DiamondBuilder
  LETTERS = ("A".."Z").to_a
  FIRST_LETTER = LETTERS.first
  BREAK_LINE = "\n"

  def initialize(letter)
    @letter = letter
  end

  def build
    return situate(FIRST_LETTER) if @letter == FIRST_LETTER
    return result_for_c if @letter == "C"

    result = first_half + gap + second_half
    remove_trailing_spaces_from(result) + BREAK_LINE
  end

  private

  def result_for_c
    external_spaces_for_b = " " * (LETTERS.index(@letter) - LETTERS.index("B"))
    line_b = external_spaces_for_b + LETTERS[1] + " " + LETTERS[1] + external_spaces_for_b + BREAK_LINE
    first_half_for_c = "#{situate(FIRST_LETTER)}#{line_b}#{@letter}"
    result_for_c = first_half_for_c + gap + first_half_for_c.reverse

    remove_trailing_spaces_from(result_for_c) + BREAK_LINE
  end

  def first_half
    situate(FIRST_LETTER) + @letter
  end

  def situate(ramon)
    external_spaces + ramon + external_spaces + BREAK_LINE
  end

  def external_spaces
    " " * LETTERS.index(@letter)
  end

  def gap
    " " * (LETTERS.index(@letter) * 2 - 1)
  end

  def second_half
    first_half.reverse
  end

  def remove_trailing_spaces_from(result)
    result.split(BREAK_LINE).map{ |l| l.rstrip }.join(BREAK_LINE)
  end
end
