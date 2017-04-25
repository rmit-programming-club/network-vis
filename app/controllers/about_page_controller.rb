class AboutPageController < ApplicationController

  def project_contributors
    @contributors ||= Octokit.contributors('rmit-programming-club/network-vis')
  end
  def show
    render :template => 'about_page/start', :locals => {:data => project_contributors}
  end
end
