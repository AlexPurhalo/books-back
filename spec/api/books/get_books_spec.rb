require 'helper_spec'

describe 'GET the books' do
  def app
    Books
  end

  before { Books.before { env['api.tilt.root'] = 'app/views' } }

  before do
    ['fantasy'].each { |genre| Genre.create(genre: genre)}
    authors = [{ name: 'J.R.R. Tolkien', biography: 'my best friend' }]
    authors.each { |author| Author.create(name: author[:name], biography: author[:biography]) }
    books = [
        { title: 'The Hobbit', brief: 'very good story', genre: 'fantasy',
          authors: ['J.R.R. Tolkien'], cover: 'data:image/png;base64,iVBORw0KGgoAA...' },
        { title: 'Lord of the Rings', brief: 'just love it', genre: 'fantasy',
          authors: ['J.R.R. Tolkien'], cover: 'data:image/png;base64,SDw09GKoAHdfK...' }
    ]

    books.each do |book|
      Book.create(title: book[:title], brief: book[:brief],
                  genre_id: Genre.where(genre: book[:genre]).first.id,
                  cover: book[:cover])
          .authors.push(Author.where(name: book[:authors].each { |author| author }).first)
    end
  end

  before { get '/books' }

  it 'renders serialized books list' do
    books_list = [
        { id: 1, title: 'The Hobbit', cover: 'data:image/png;base64,iVBORw0KGgoAA...',
          authors: [{ id: 1, name: 'J.R.R. Tolkien'}]},
        { id: 2, title: 'Lord of the Rings', cover: 'data:image/png;base64,SDw09GKoAHdfK...',
          authors: [{ id: 1, name: 'J.R.R. Tolkien'}]},
    ]

    expect(last_response.body).to eq(books_list.to_json)
  end



  it 'has 200 status' do
    expect(last_response.status).to eq(200)
  end
end