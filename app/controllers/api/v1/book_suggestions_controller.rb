module Api
  module V1
    class BookSuggestionsController < ApiController
      before_action :authenticate_user!
      def create
        new_book_sugges = BookSuggestion.new(book_sugges_params)
        if new_book_sugges.save
          render json: new_book_sugges, serializer: BookSuggestionSerializer, status: :created
        else
          render json: { errors: new_book_sugges.errors }, status: :unprocessable_entity
        end
      end

      def book_sugges_params
        params.require(:book_suggestion)
              .permit(:user_id, :synopsis, :price, :genre, :author,
                      :image, :title, :editor, :year)
              .merge(user: current_user)
      end
    end
  end
end
