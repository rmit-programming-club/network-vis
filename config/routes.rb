Rails.application.routes.draw do
  get 'welcome_page/welcome'
  root 'welcome_page#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'graph/index'
  get 'graph/data', :defaults => { :format => 'json' }
  get 'about', to: 'about_page#start'
end
