class ProfilesController < ApplicationController

  def organisation
    render json: {"you entered in": params.fetch('organisation_name')}
  end

  def person
    org_name = params.fetch('organisation_name')
    person = params.fetch('person_username')
    if organisation_members(org_name).any? {|h| h[:login] == person}
      render json: {"you entered in": person, "who is in": org_name}
    else
      render json: {"you entered in": person, "who is missing from": org_name}
    end
  end

  private

  def gh_client
    @client ||= begin
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

      client
    end
  end

  def user
    gh_client.user
  end

  def organisation_members(org_name)
    @org_membs ||= gh_client.organization_members(org_name)
  end

  def user_organisations
    @organisations ||= gh_client.organizations(user)
  end
end
