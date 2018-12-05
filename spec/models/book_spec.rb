require 'rails_helper'
require 'faker'

describe Book, type: :model do
  subject(:book) { build(:book) }
  # Validation for each attr
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:editor) }
  it { is_expected.to validate_presence_of(:year) }
  # End of validation for Each attr
  # Validations for this instance
  it { is_expected.to be_a_new(Book) }
  it { is_expected.to be_valid }
  # End of Validation for this instance.
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
