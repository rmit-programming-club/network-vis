class ProfilesController < ApplicationController

  def organisation
    render json: {"you entered in": params.fetch('organisation_name')}
  end

  def person
    render json: {"you entered in": params.fetch('person_username'), "who is in": params.fetch('organisation_name')}
  end
end
