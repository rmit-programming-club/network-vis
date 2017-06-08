Rails.application.routes.draw do
  get 'organizations/index'
  get 'organizations/network', defaults: { format: 'json' }

  get 'welcome_page/welcome'
  root 'welcome_page#welcome'

  get 'graph/index'
  get 'graph/network'
  get 'graph/data', defaults: { format: 'json' }

  get 'about', controller: 'about_page', action: 'show'
end
