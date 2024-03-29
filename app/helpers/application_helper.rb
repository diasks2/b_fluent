# -*- encoding : utf-8 -*-
module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "BiFluent"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def logo
    image_tag("NavBarLogo.png", alt: "BiFluent", class: "round")
  end

  def convert_to_amcharts_json(data_array)
    data_array.to_json.gsub(/\"text\"/, "text").html_safe
  end
end
