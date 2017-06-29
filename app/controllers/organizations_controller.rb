class OrganizationsController < ApplicationController

  #for windows devs
  ENV['SSL_CERT_FILE'] = File.expand_path(File.dirname(__FILE__)) + '/config/cacert.pem'

  # TODO add OAth
  # currently authentication through user, need to change to using
  # OAuth token and authentication with Organisation rather than a user.
  # with the org

  @orgName
  @members
  @repos
  @memberRepos
  @memberRepoCommits

  def index

    client = Octokit::Client.new

    # Using enviroment variables for authentication
    # Use commands to set username and password
    #   export GITHUB_USERNAME="my_username"
    #   export GITHUB_PASSWORD="my_password"

    # Provide authentication credentials
    client.configure do |c|
      c.login = Rails.application.secrets.github_username
      c.password = Rails.application.secrets.github_password
    end

    # Fetch the current user and their organizations
    user = client.user
    organizations = client.organizations(user)
    

    # TODO add check for a specific org, currently just gets first
    org = organizations[0][:login]
    @orgName = org
    @repos = client.repos(org)
    @members = client.organization_members(org)
    
    @member_names = @members.map{|member| member[:login]}
    @links = Array.new
    @member_names.combination(2){
      |m1, m2|
      @links << {:source => m1, :target => m2, :value => 0}
    }
    

    aMember = @members[0]
    # Gets the first members
    @memberRepos = client.repos(aMember[:login])
    repo = @memberRepos[0][:full_name]
    @memberRepoCommits = client.list_commits(repo)
    byebug()

  end
end
