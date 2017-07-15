class ProfilesController < ApplicationController
  COLLAB_TYPES = [
    'CommitCommentEvent', 'ForkEvent', 'IssueCommentEvent',
    'IssuesEvent', 'PullRequestEvent', 'PullRequestReviewEvent',
    'PullRequestReviewCommentEvent', 'PushEvent'
  ]

  CONTRIBUTION_TYPES = [
    'PushEvent', 'PullRequestEvent', 'IssuesEvent'
  ]

  def organisation
    render json: {"you entered in": params.fetch('organisation_name')}
  end

  def person
    org_name = params.fetch('organisation_name')
    person = params.fetch('person_username')

    organisation = Organization.where(name: org_name).first_or_create do |org|
      organisation_members(org_name).each do |member|
        org.users.build username: member[:login]
      end
    end

    if organisation.members.where(username: person).any?
      render json: {"you entered in": person,
                    "who is in": org_name}
    else
      render json: {"you entered in": person,
                    "who is missing from": org_name}
    end
  end

  private

  # This can take AGEESSSS to finish
  def connected_members(user_events)
    connected = {}
    members = organisation_members(params.fetch('organisation_name'))
    repos = Set.new
    # build list of repos and their contributors
    user_events.each do |event|
      next unless COLLAB_TYPES.include? event[:type]
      repos << event[:repo][:name]
    end

    repos.each do |r|
      next if r == "Zendesk"
      gh_client.contributors(r).each do |contributor|
        next unless members.include(contributor[:login])
        if connected.key? contributor[:login]
          connected[contributor[:login]] += 1
        else
          connected[contributor[:login]] = 1
        end
      end
    end

    connected
  end

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
        c.auto_paginate = true
      end

      client
    end
  end

  def user
    gh_client.user
  end

  def user_events
    @user_events ||= gh_client.user_events(person)
  end

  def organisation_members(org_name)
    @org_membs ||= gh_client.organization_members(org_name)
  end

  def user_organisations
    @organisations ||= gh_client.organizations(user)
  end
end
