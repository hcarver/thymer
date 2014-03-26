module ApplicationHelper

  HOURS_PER_DAY=7

  def time_diff_in_natural_language(time_seconds)
    distance_in_seconds = time_seconds.round
    components = []

    if distance_in_seconds >= HOURS_PER_DAY.hour
      delta = (distance_in_seconds / HOURS_PER_DAY.hour).floor
      distance_in_seconds -= (delta * HOURS_PER_DAY).hour
      components << pluralize(delta, 'day')
    end

    %w(hour minutes).each do |interval|
      # For each interval type, if the amount of time remaining is greater than
      # one unit, calculate how many units fit into the remaining time.
      if distance_in_seconds >= 1.send(interval)
        delta = (distance_in_seconds / 1.send(interval)).floor
        distance_in_seconds -= delta.send(interval)
        components << pluralize(delta, interval)
      end
    end

    components.join(", ")
  end
end
