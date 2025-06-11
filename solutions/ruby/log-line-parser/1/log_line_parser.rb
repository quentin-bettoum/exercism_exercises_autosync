class LogLineParser
  @@regexp = /^\[(INFO|WARNING|ERROR)\]: (.*)/

  def initialize(line)
    @line = line
  end

  def message
    @line[@@regexp, 2].strip
  end

  def log_level
    @line[@@regexp, 1].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
