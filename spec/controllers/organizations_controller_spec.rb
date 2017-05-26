require 'rails_helper.rb'

describe OrganizationsController, type: :controller do
  describe '#index' do
    it 'routes to the organizations page' do
      expect(get: '/organizations/index').to \
        route_to(controller: 'organizations',
                 action: 'index')
    end
  end
end
