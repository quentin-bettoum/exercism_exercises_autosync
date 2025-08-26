class JuiceMaker
  @running : Bool
  @fluid : Int32

  def initialize(fluid)
    @running = false
    @fluid = fluid
  end

  def self.debug_light_on?
    true
  end

  def start
    @running = true
  end

  def stop(minutes)
    @running = false
    @fluid -= minutes * 5
  end

  def running?
    @running
  end

  def add_fluid(fluid)
    @fluid += fluid
  end
end
