module ApplicationHelper
  def obfuscate_from_left(string, options={})
    n_chars_to_show = options[:n_chars_to_show] || 4
    return string if n_chars_to_show >= string.length

    n_chars_to_hide = string.length - n_chars_to_show
    hidden_chars = Array.new(n_chars_to_hide, '*').join("")
    visible_chars = string.last(4)
    "#{hidden_chars}#{visible_chars}"
  end
end
