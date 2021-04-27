require 'rails_helper'

RSpec.describe 'Welcomes', type: :request do
  describe 'GET /index' do
    it 'renders index' do   #
      get '/'
      expect(response).to render_template(:index)
    end
  end
end
