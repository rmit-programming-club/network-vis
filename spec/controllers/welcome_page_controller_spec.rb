require 'rails_helper'

describe WelcomePageController, type: :controller do
  describe '#welcome' do
    it 'routes to the root page of app' do
      expect(get: '/').to \
        route_to(controller: 'welcome_page',
                 action: 'welcome')
    end
  end
end
