module StimulusHelpers
  def initialize_timer(element, deadline)
    # Your existing initializeClock logic here
    # ...

    # Use Stimulus' @target references for timer elements
    hours_target = element.querySelector(".hours")
    minutes_target = element.querySelector(".minutes")

    initializeClock(hours_target, minutes_target, deadline)
  end
end
