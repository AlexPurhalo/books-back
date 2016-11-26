require 'helper_spec'

describe 'GET a author' do
  def app; Authors end

  before { Authors.before { env['api.tilt.root'] = 'app/views' } }

  before do
    Genre.create(genre: 'fantasy')

    Author.create(name: 'J.R.R. Tolkien', biography: 'my best friend')

    books = [
        { title: 'The Hobbit', brief: 'very good story', genre: 'fantasy', authors: ['J.R.R. Tolkien'] },
        { title: 'Lord of the Rings', brief: 'just love it', genre: 'fantasy', authors: ['J.R.R. Tolkien'] }
    ]

    books.each do |book|
      Book.create(title: book[:title], brief: book[:brief], genre_id: Genre.where(genre: book[:genre]).first.id)
          .authors.push(Author.where(name: book[:authors].each { |author| author }).first)
    end
  end

  before { get '/authors/1' }

  it 'renders a serialized author data' do
    author_data = { id: 1, name: 'J.R.R. Tolkien', biography: 'my best friend',
                    books: [{ id: 1, title: 'The Hobbit' }, { id: 2, title: 'Lord of the Rings' }]}
    expect(last_response.body).to eq(author_data.to_json)
  end

  it 'has a correct 200 status' do
    expect(last_response.status).to eq(200)
  end
end