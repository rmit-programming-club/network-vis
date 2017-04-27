class AboutPageController < ApplicationController
  #for windows devs
  ENV['SSL_CERT_FILE'] = File.expand_path(File.dirname(__FILE__)) + '/config/cacert.pem'

  def project_contributors
    @contributors ||= Octokit.contributors('rmit-programming-club/network-vis')
  end

  def show
    render :template => 'about_page/start', :locals => {:data => project_contributors}
  end
end
