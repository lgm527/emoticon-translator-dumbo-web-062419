# require modules here
require "pry"
require "yaml"

def load_library(yml_file)
  emoticons = YAML.load_file(yml_file)
  result = { "get_meaning" => {},
            "get_emoticon" => {} }

  emoticons.each do |emotion_name, emoji_array|
    emoji_array.each do |emoji|
      if emoji_array.first == emoji
        result["get_emoticon"][emoji] = emoji_array[1]
      else
        result["get_meaning"][emoji] = emotion_name
      end
    end
  end
  result
end

def get_japanese_emoticon(yml_file, emoticon)
  hash = load_library(yml_file)
  result = "Sorry, that emoticon was not found"
  if hash["get_emoticon"].has_key?(emoticon)
    result = hash["get_emoticon"][emoticon]
  end
  result
end

def get_english_meaning(yml_file, emoticon)
  hash = load_library(yml_file)
  result = "Sorry, that emoticon was not found"
  if hash["get_meaning"].has_key?(emoticon)
    result = hash["get_meaning"][emoticon]
  end
  result
end
