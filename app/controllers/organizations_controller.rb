class OrganizationsController < ApplicationController

  #for windows devs
  ENV['SSL_CERT_FILE'] = File.expand_path(File.dirname(__FILE__)) + '/config/cacert.pem'

  # TODO add OAth
  # currently authentication through user, need to change to using
  # OAuth token and authentication with Organisation rather than a user.
  # with the org

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
    set_org
    @repos = client.repos(@org)

    # Create a new hash and set default_proc so new entries are given a default
    # value of 0, this is similar to python's default_dict
    @occurrences = Hash.new
    @occurrences.default_proc = proc { |hash, key| hash[key] = 0}
    @contributors = Set.new

    # Search each repo in the organisation
    @repos.each { |repo|
      # For each set of contributors in the repo
      client.contributors(repo[:full_name]).map{ |contributor|
        @contributors << contributor[:login]
        # Get all possible pairs of contributors
        contributor[:login]}.combination(2) {
          |c1, c2|
          # As a set, so they don't double up, avoids (jeff, dave) and
          # (dave, jeff) being different entries
          link = Set.new [c1, c2]
          # Increment the amount of times that pair have appeared in a repo
          # together
          @occurrences[link] += 1
        }
    }

    @nodes = @contributors.map{ |contributor| {:id => contributor, :group => (rand(2) + 1)} }

    # Reformat @occurences for consumption by d3
    @links = @occurrences.map { |occurrence, value|
      # Current hacky solution for dealing with sets, I can't just do set[0] as
      # they are unordered, if you have a more elegant solution, please change
      o_array = occurrence.to_a
      {:source => o_array[0], :target => o_array[1], :value => value}
    }


    # @members = client.organization_members(org)
    # @member_names = @members.map{|member| member[:login]}
    # @links = Array.new
    # @member_names.combination(2){
    #   |m1, m2|
    #   @links << {:source => m1, :target => m2, :value => 0}
    # }

    # @members.each { |member|
    #   repos = client.repos(member[:login])
    # }

    # #client.contributors(repo[:full_name])

    # aMember = @members[0]
    # # Gets the first members
    # @memberRepos = client.repos(aMember[:login])
    # repo = @memberRepos[0][:full_name]
    # @memberRepoCommits = client.list_commits(repo)
    render :json => {:nodes => @nodes, :links => @links}

  end

  def activity_heatmap
    today = DateTime.now
    a_week_ago = DateTime.now - 7.days

    data = {today.to_i => 4, a_week_ago.to_i => 2}.to_json

    render :json => data
  end

  private

    def set_org
      if !params[:name].blank?
        @org = params[:name]
      else
        @org = "rmit-programming-club"
      end
    end

    def org_params
      params.require(:org).permit(:name)
    end

end
