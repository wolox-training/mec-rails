module Api
  module V1
    class BookSuggestionsController < ApplicationController
      def create
        new_book_sugges = BookSuggestion.new(book_sugges_params)
        params[:user_id] = authenticated_user.id if user_signed_in?
        if new_book_sugges.save
          render json: new_book_sugges, serializer: BookSuggestionSerializer, status: :created
        else
          render json: { errors: new_book_sugges.errors }, status: :unprocessable_entity
        end
      end

      def book_sugges_params
        params.require(:book_suggestion).permit(:user_id, :synopsis, :price, :genre, :author,
                                                 :image, :title, :editor, :year)
      end
    end
  end
end
