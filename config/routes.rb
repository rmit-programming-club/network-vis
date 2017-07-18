Rails.application.routes.draw do
  get 'organizations/index'
  get 'organizations/activity_heatmap'

  get 'welcome_page/welcome'
  root 'welcome_page#welcome'

  get 'graph/index'
  get 'graph/network'
  get 'graph/data', defaults: { format: 'json' }

  get 'about', controller: 'about_page', action: 'show'

  scope 'profiles', controller: 'profiles' do
    get "/:organisation_name", action: 'organisation', format: 'json'
    get "/:organisation_name/:person_username", action: 'person', format: 'json'
  end
end
