require 'helper_spec'

describe 'GET authors' do
  def app
    Authors
  end

  before do
    get '/authors'
  end

  it 'renders a message about authors list' do
    expect(last_response.body).to eq({ message: 'Should renders the authors list' }.to_json)
  end

  it 'has a correct status' do
    expect(last_response.status).to eq(200)
  end
end