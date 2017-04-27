class OrganizationsController < ApplicationController

  ENV['SSL_CERT_FILE'] = File.expand_path(File.dirname(__FILE__)) + "/config/cacert.pem"

  # TODO add OAth
  # currently authentication through user, need to change to using
  # OAuth token and authentication with Organisation rather than a user.
  # with the org
  def index
    client = Octokit::Client.new

    # Provide authentication credentials
    client.configure do |c|
      c.login = 'LouisKnuckles'
      c.password = '#PASSWORD'
    end

    # Fetch the current user and their organizations
    user = client.user
    organizations = client.organizations(user)

    # TODO add check for a specific org, currently just gets first
    org = organizations[0][:login]
    @orgName = org
    @repos = client.repos(org)
    @members = client.organization_members(org)

    aMember = @members[0]
    # Gets the first members
    @memberRepos = client.repos(aMember[:login])
    repo = @memberRepos[0][:full_name]
    @memberRepoCommits = client.list_commits(repo)





#
#    <thead><b>A members repo commits</b></thead>
 #   <% @memberRepoCommits.each do |commit| %>
  #    <tr>
   # <td><%= commit[:url] %></td>
    #  </tr>
 # <% end %>
#</table>


  end

end
