require 'helper_spec'

describe 'GET books' do
  def app
    Books
  end

  before do
    get '/books'
  end

  it 'renders a message about the books list' do
    expect(last_response.body).to eq({ message: 'Should renders the books list' }.to_json)
  end

  it 'has 200 status' do
    expect(last_response.status).to eq(200)
  end
end