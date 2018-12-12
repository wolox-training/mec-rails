require 'openlibrary_service'
module Api
  module V1
    class QueryBookController < ApplicationController
      def query_by_isbn
        service = OpenLibraryService.new
        external_response = service.book_info(params[:isbn])
        render json: external_response
      end
    end
  end
end
