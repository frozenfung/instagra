module ApplicationHelper

  def tags_link_to(tags)    
    tags.map{ |t|
      link_to("##{t.name}", root_path(:tag => t.name))
    }.join(" ").html_safe
  end

end
