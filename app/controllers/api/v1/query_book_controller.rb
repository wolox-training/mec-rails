require 'openlibrary_service'
module Api
  module V1
    class QueryBookController < ApplicationController
      def query_by_isbn
        service = OpenLibraryService.new
        external_response = service.book_info(params[:isbn])
        if external_response.ok?
          render json: service.parsing_isbn_response(external_response)
        else
          render json: external_response.message, status: :bad_request
        end
      end
    end
  end
end
