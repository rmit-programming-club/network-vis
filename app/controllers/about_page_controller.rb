class AboutPageController < ApplicationController

  def project_contributors
  end

  def show
    render :template => 'about_page/start', :locals => {:data => project_contributors}
  end
end
