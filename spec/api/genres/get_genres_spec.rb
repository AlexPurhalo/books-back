require 'helper_spec'

describe 'GET genres' do
  def app
    Genres
  end

  before do
    get '/genres'
  end

  it 'renders a message about the genres list' do
    expect(last_response.body).to eq({ message: 'Should renders the genres list'}.to_json)
  end

  it 'has a correct status' do
    expect(last_response.status).to eq(200)
  end
end