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
        book = create(:book)
        expect(Book.exists?(title: book.title)).to eq(true)
      end
    end
  end
end
