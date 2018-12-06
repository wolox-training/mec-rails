module Api
  module V1
    class RentSerializer < ActiveModel::Serializer
      attributes :user, :book, :start, :end
      belongs_to :user
      belongs_to :book
    end
  end
end
