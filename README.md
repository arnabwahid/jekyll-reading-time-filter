# jekyll-reading-time-filter

A tiny, configurable reading-time Liquid filter for Jekyll.  
It calculates the estimated reading time of your posts or pages and displays it in a clean, Medium-style format (`3 min read`) or with detailed minutes and seconds if you prefer.

---

## Description

`jekyll-reading-time-filter` adds a Liquid filter to your Jekyll site that computes how long it takes to read a given page or post.  
It supports:

- Customizable **words per minute (WPM)**
- **Seconds precision** (optional)
- Configurable **labels and format**
- Safe defaults, producing reader-friendly estimates

This makes it easy to show your readers how much time they’ll need to invest before diving into your content.

---

## Installation

Add the gem to your Jekyll site’s `Gemfile`:

```ruby
gem "jekyll-reading-time-filter"
```

Run:

```bash
bundle install
```

Then enable the plugin in your Jekyll `_config.yml`:

```yml
plugins:
  - jekyll-reading-time-filter
```

> On Jekyll < 3.5, use the `gems:` key instead of `plugins:`.

---

## Usage

In your layout or post templates, add:

```liquid
Read this in about {{ page.content | reading_time }}
```

Examples:

```liquid
{{ page.content | reading_time }}
# => "3 min read"

{{ page.content | reading_time: true }}
# => "2 minutes, 18 seconds"
```

---

## Configuration Options

You can configure defaults in `_config.yml`:

```yml
reading_time:
  words_per_minute: 200   # default: 180
  show_seconds: false     # default: false
  format: short           # "short" => "3 min read", "long" => "3 minutes read"
  min_label: "minute"     # default: "minute"
  mins_label: "minutes"   # default: "minutes"
  sec_label: "second"     # default: "second"
  secs_label: "seconds"   # default: "seconds"
```

- **words_per_minute** → Adjust average WPM to your audience  
- **show_seconds** → Include seconds in output (true/false)  
- **format** → `short` gives “3 min read”, `long` gives “3 minutes read”  
- **labels** → Fully customizable for localization  

---

## Why this gem?

- **Accurate**: Proper second calculation (not just percentages)  
- **Configurable**: Tune WPM, labels, and formatting  
- **Reader-friendly**: Medium-style “min read” output by default  
- **Jekyll native**: Easy drop-in Liquid filter, no extra scripts  
- **Localized**: Customize wording for international audiences  

---

## License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for details.
