module ApplicationHelper
  
  # Use this to make the nav buttons active when on the corresponding page
  # If you want to include other classes pass them in as a string
  def active(link_path, other_classes)
    current_page?(link_path) ? "#{other_classes} active" : "#{other_classes}"
  end
  
end
