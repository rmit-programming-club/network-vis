require 'rails_helper.rb'

describe GraphController, type: :controller do
  describe '#index' do
    it 'routes to a placeholder bar graph' do
      expect(get: '/graph/index').to \
        route_to(controller: 'graph',
                 action: 'index')
    end
  end

  describe '#network' do
    it 'routes to a placeholder network page' do
      expect(get: '/graph/network').to \
        route_to(controller: 'graph',
                 action: 'network')
    end
  end

  describe '#data' do
    it 'routes to a data serving page' do
      expect(get: '/graph/data').to \
        route_to(controller: 'graph',
                 action: 'data',
                 format: 'json')
    end

    it 'renders the correct dummy json data' do
      @expected = [1,2 ,3, 4, 9].to_json

      get :data, format: 'json'
      expect(response.body).to eq(@expected)
    end
  end
end
