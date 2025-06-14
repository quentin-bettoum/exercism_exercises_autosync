class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons_id)
    wagons_id
  end

  def self.fix_list_of_wagons((first, second, third, *rest), missing_wagons)
    [third, *missing_wagons, *rest, first, second]
  end

  def self.add_missing_stops(routing, **stops)
    { **routing, **{ stops: stops.values } }
  end

  def self.extend_route_information(route, more_route_information)
    { **route, **more_route_information }
  end
end
