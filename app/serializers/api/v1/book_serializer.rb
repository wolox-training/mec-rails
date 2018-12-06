module Api
  module V1
    class BookSerializer < ActiveModel::Serializer
      attributes :id, :genre, :author, :image, :title, :editor, :year
      has_one :rent
    end
  end
end
