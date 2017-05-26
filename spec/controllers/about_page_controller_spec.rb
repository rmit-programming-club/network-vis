require 'rails_helper'

describe AboutPageController, type: :controller do
  describe '#show' do
    it 'routes to the about page' do
      expect(get: '/about').to \
        route_to(controller: 'about_page',
                 action: 'show')
    end
  end
end
