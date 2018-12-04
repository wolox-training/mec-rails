require 'rails_helper'
require 'faker'

describe Book do
  subject(:book) do
    Book.new(
      genre: Faker::Book.genre,
      author: Faker::Book.author,
      image: Faker::File.file_name('path/to'),
      title: Faker::Book.title,
      editor: Faker::Book.publisher,
      year: Faker::Number.number(4)
    )
  end
  it { is_expected.to be_a_new(Book) }
  it { is_expected.to be_new_record }
  it { is_expected.to be_valid }

  describe 'Book model tests' do
    context 'When book is created' do
      it 'Check a succeful save' do
        book = Book.new(genre: 'Comedy', author: 'Wolox', image: 'AnImage', title: 'Test tittle',
                        editor: 'Wolox', year: 2000)
        book.save!
        expect(Book.exists?(title: 'Test tittle')).to eq(true)
      end
    end
  end
end
