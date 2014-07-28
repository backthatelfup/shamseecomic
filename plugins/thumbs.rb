 
# Octopress/Jekyll Thumbnail-Tag plugin by Lukas Schauer (https://lukas.im)
# 
# Based on original Jekyll Image-Tag plugin by Brandon Mathis, Felix Schäfer and Frederic Hemberger
#
# Syntax {% thumbnail [class name(s)] /path/to/image [width [height]] [title text | "title text" ["alt text"]] %}
#
# Examples:
# {% thumbnail left /images/articles/flederschranke/2013-04-21_03.05.06_hdr.jpg 300 %}
# {% thumbnail center /images/articles/wineskin-winery/Screen-Shot-2012-08-04-at-7.04.47-PM.png 770 %}
# {% thumbnail right /images/articles/flederschranke/fllogger_mayen_03.jpg 100 %}

require 'mini_magick.rb'

module Jekyll

  class ThumbnailTag < Liquid::Tag
    @img = nil

    def initialize(tag_name, markup, tokens)
      attributes = ['class', 'src', 'width', 'height', 'title']

      if markup =~ /(?<class>\S.*\s+)?(?<src>(?:https?:\/\/|\/|\S+\/)\S+)(?:\s+(?<width>\d+))?(?:\s+(?<height>\d+))?(?<title>\s+.+)?/i
        @img = attributes.reduce({}) { |img, attr| img[attr] = $~[attr].strip if $~[attr]; img }
        if /(?:"|')(?<title>[^"']+)?(?:"|')\s+(?:"|')(?<alt>[^"']+)?(?:"|')/ =~ @img['title']
          @img['title']  = title
          @img['alt']    = alt
        else
          @img['alt']    = @img['title'].gsub!(/"/, '&#34;') if @img['title']
        end
        @img['class'].gsub!(/"/, '') if @img['class']
      end
      super
    end

    def render(context)
      source = Pathname.new(context.registers[:site].source).expand_path
      @img['orig_src'] = @img['src']
      width = @img['width']
      height = @img['height']
      @img['width'] = ''
      @img['height'] = ''
      image_path = source + @img['orig_src'].sub(%r{^/}, '')
      if width
        if height
          thumb_suffix = "_thumb_#{width}_#{height}"
        else
          thumb_suffix = "_thumb_#{width}"
        end
        thumb_path = "#{image_path}#{thumb_suffix}.jpg"
        @img['src'] = @img['orig_src'] + "#{thumb_suffix}.jpg"
        if not File.exists?(thumb_path)
          image = MiniMagick::Image.open(image_path)
          if height
            image.resize("#{width}x#{height}")
          else
            image.resize("#{width}x")
          end
          image.format("jpg")
          image.write(thumb_path)
        end
      end
      if @img
        "<a href=\"#{@img['orig_src']}\"><img #{@img.collect {|k,v| "#{k}=\"#{v}\"" if v}.join(" ")}></a>"
      else
        "Error processing input, expected syntax: {% thumbnail [class name(s)] /path/to/image [width [height]] [title text | \"title text\" [\"alt text\"]] %}"
      end
    end
  end
end

Liquid::Template.register_tag('thumbnail', Jekyll::ThumbnailTag)