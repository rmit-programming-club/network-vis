class OrganizationsController < ApplicationController

  ENV['SSL_CERT_FILE'] = File.expand_path(File.dirname(__FILE__)) + "/config/cacert.pem"

  @test

  def index
    # Provide authentication credentials
    Octokit.configure do |c|
      c.login = 'LouisKnuckles'
      c.password = 'PASSWORD'
    end

    # Fetch the current user
    user = Octokit.user 'louisknuckles'
    @test = user.rels[:repos].href

  end

end
