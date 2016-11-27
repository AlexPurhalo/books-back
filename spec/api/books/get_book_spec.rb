require 'helper_spec'

describe 'GET a book' do
  def app; Books end

  before { Books.before { env['api.tilt.root'] = 'app/views' } }

  before do
    Genre.create(genre: 'technical literature')
    authors = [
        { name: 'Thoughtbot', biography: 'love this boy' },
        { name: 'Harlow Ward', biography: 'he is awesome' },
        { name: 'Joe Ferris', biography: 'perfect man' }
    ]

    authors.each do |author|
      Author.create(name: author[:name], biography: author[:biography] )
    end

    book = { title: 'Ruby Science', brief: 'some interesting stuff', genre: 'technical literature',
             authors: ['Thoughtbot', 'Harlow Ward', 'Joe Ferris']}

    Book.create(title: book[:title], brief: book[:brief],
                genre_id: Genre.where(genre: book[:genre]).first.id,
                cover: 'data:image/png;base64,iVBORw0KGgoAA...')

    Book.last.authors.push(Author.first)
    Book.last.authors.push(Author.second)
    Book.last.authors.push(Author.third)
  end

  before { get '/books/1' }

  it 'shows a serialized data about book' do
    book_data = { id: 1, title: 'Ruby Science', brief: 'some interesting stuff',
                  cover: 'data:image/png;base64,iVBORw0KGgoAA...',
                  authors: [{id: 1, name: 'Thoughtbot' }, { id: 2, name: 'Harlow Ward' }, { id: 3, name: 'Joe Ferris' }],
                  genre: 'technical literature'}
    expect(last_response.body).to eq(book_data.to_json)
  end

  it 'has a correct 200 status' do
    expect(last_response.status).to eq(200)
  end
end