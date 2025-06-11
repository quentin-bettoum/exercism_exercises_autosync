class LogLineParser
  REGEXP = /^\[(INFO|WARNING|ERROR)\]: (.*)/.freeze

  def initialize(line)
    @line = line
  end

  def message
    @line[REGEXP, 2].strip
  end

  def log_level
    @line[REGEXP, 1].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
