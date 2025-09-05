# frozen_string_literal: true

module JekyllReadingTimeFilter
  module Filter
    def reading_time(input, show_seconds_arg = nil)
      site_config   = @context&.registers&.dig(:site)&.config || {}
      rt_config     = site_config.fetch("reading_time", {})

      wpm           = positive_number(rt_config["words_per_minute"], 180.0)
      format        = (rt_config["format"] || "short").to_s
      cfg_show_secs = !!rt_config["show_seconds"]

      show_seconds  = show_seconds_arg.nil? ? cfg_show_secs : !!show_seconds_arg

      min_label     = (rt_config["min_label"]  || "minute").to_s
      mins_label    = (rt_config["mins_label"] || "minutes").to_s
      sec_label     = (rt_config["sec_label"]  || "second").to_s
      secs_label    = (rt_config["secs_label"] || "seconds").to_s

      words         = count_words(input.to_s)
      return less_than_a_minute(format) if words.zero?

      total_seconds = (words / wpm * 60).round
      minutes       = total_seconds / 60
      seconds       = total_seconds % 60

      if show_seconds
        parts = []
        parts << "#{minutes} #{minutes == 1 ? min_label : mins_label}" if minutes.positive?
        parts << "#{seconds} #{seconds == 1 ? sec_label : secs_label}" if seconds.positive?
        return parts.any? ? parts.join(", ") : less_than_a_minute(format)
      end

      display_minutes = [ (total_seconds / 60.0).ceil, 1 ].max
      if format == "long"
        "#{display_minutes} #{display_minutes == 1 ? min_label : mins_label} read"
      else
        unit = display_minutes == 1 ? "min" : "mins"
        "#{display_minutes} #{unit} read"
      end
    end

    private

    def count_words(text)
      stripped = text.gsub(/<[^>]*>/, " ")
      words = stripped.scan(/[[:word:]]+/)
      words.size
    end

    def positive_number(value, fallback)
      n = value.to_f
      n.positive? ? n : fallback
    end

    def less_than_a_minute(format)
      format == "long" ? "Less than 1 minute" : "< 1 min"
    end
  end
end

Liquid::Template.register_filter(JekyllReadingTimeFilter::Filter)
