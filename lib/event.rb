require 'time'
require 'pry'

class Event
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(start_date_str, duration_minutes, title="", attendees=[])
    @start_date = Time.parse(start_date_str)
    @duration = duration_minutes
    @title = title
    @attendees = attendees
  end

  def postpone_24h
    @start_date += 24 * 60 * 60
  end

  def end_date
    end_date = @start_date + @duration
    return end_date
  end

  def is_past?
    Time.now > @start_date + @duration
  end

  def is_future?
    !is_past?
  end

  def is_soon?
    @start_date - Time.now < 30 * 60 # 30 minutes en secondes
  end

  def to_s
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date}"
    puts "Durée : #{@duration} minutes"
    puts "Invités : #{@attendees.join(", ")}"
  end
end
binding.pry