# Reading Time Jekyll Plugin
An elegent estimated reading time calculator for Jekyll

![Screenshot](./screenshot.png)

## Installation

Drop the file in your Jekyll site's `_plugins` directory.

## Usage
Put `{{ post.content | reading_time }}` where you want to print your estimated reading time.

**Example:** 

```ruby
<span>/ Reading Time: {{ post.content | reading_time }}</span>
```
