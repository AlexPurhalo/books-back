require 'helper_spec'

describe 'GET the authors' do
  def app
    Authors
  end

  before { Authors.before { env['api.tilt.root'] = 'app/views' } }

  before do
    ['fantasy'].each { |genre| Genre.create(genre: genre)}
    authors = [{ name: 'J.R.R. Tolkien', biography: 'my best friend' }]
    authors.each { |author| Author.create(name: author[:name], biography: author[:biography]) }
    books = [
        { title: 'The Hobbit', brief: 'very good story', genre: 'fantasy', authors: ['J.R.R. Tolkien'] },
        { title: 'Lord of the Rings', brief: 'just love it', genre: 'fantasy', authors: ['J.R.R. Tolkien'] }
    ]

    books.each do |book|
      Book.create(title: book[:title], brief: book[:brief], genre_id: Genre.where(genre: book[:genre]).first.id)
          .authors.push(Author.where(name: book[:authors].each { |author| author }).first)
    end
  end

  before { get '/authors' }

  it 'renders the serialized authors list' do
    authors_list = [
        { id: 1, name: 'J.R.R. Tolkien', books: [{ id: 1, title: 'The Hobbit' }, { id: 2, title: 'Lord of the Rings' }]}
    ]

    expect(last_response.body).to eq(authors_list.to_json)
  end

  it 'has a correct status' do
    expect(last_response.status).to eq(200)
  end
end