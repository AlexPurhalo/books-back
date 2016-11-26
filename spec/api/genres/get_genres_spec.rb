require 'helper_spec'

describe 'GET the genres' do
  def app
    Genres
  end

  before do
    ['fantasy', 'horror'].each { |genre| Genre.create(genre: genre)}
  end

  before { get '/genres' }

  it 'renders the serialized genres list' do
    genres_list = [{ id: 1, genre: 'fantasy' }, {id: 2, genre: 'horror' }]
    expect(last_response.body).to eq(genres_list.to_json)
  end

  it 'has a correct status' do
    expect(last_response.status).to eq(200)
  end
end