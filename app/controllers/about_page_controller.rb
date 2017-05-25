class AboutPageController < ApplicationController

  #For details see https://github.com/rmit-programming-club/network-vis/issues/15
  ENV['SSL_CERT_FILE'] = File.expand_path(File.dirname(__FILE__)) + '/config/cacert.pem'

  def project_contributors
    @contributors ||= Octokit.contributors('rmit-programming-club/network-vis')
  end

  def show
    render template: 'about_page/start', locals: {data: project_contributors}
  end
end
