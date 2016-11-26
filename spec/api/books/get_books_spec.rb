require 'helper_spec'

describe 'GET books' do
  def app
    Books
  end

  before { Books.before { env['api.tilt.root'] = 'app/views' } }

  before do
    Book.create(title: 'The Hobbit', brief: 'very good story').authors.create(name: 'J.R.R. Tolkien')
    Book.create(title: 'Lord of the Rings', brief: 'just love it').authors.push(Author.first)
    Book.create(title: 'The Stand', brief: 'it is good').authors.create(name: 'Stephen King')
    Book.create(title: 'Ruby Science', brief: '...').authors.create(name: 'Thoughtbot')
    Author.create(name: 'Harlow Ward').books.push(Book.last)
    Author.create(name: 'Joe Ferris').books.push(Book.last)
  end

  before { get '/books' }

  it 'renders the serialized data about author and his books' do
    books_list = [
        { id: 1, title: 'The Hobbit', authors: [{ id: 1, name: 'J.R.R. Tolkien' }]},
        { id: 2, title: 'Lord of the Rings', authors: [{ id: 1, name: 'J.R.R. Tolkien' }]},
        { id: 3, title: 'The Stand', authors: [{ id: 2, name: 'Stephen King' }]},
        { id: 4, title: 'Ruby Science', authors: [
            { id: 3, name: 'Thoughtbot' }, { id: 4, name: 'Harlow Ward' }, { id: 5, name: 'Joe Ferris' }
        ]}
    ]

    expect(last_response.body).to eq(books_list.to_json)
  end

  it 'has 200 status' do
    expect(last_response.status).to eq(200)
  end
end