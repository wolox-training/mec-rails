module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
      before_action :authenticate_user!
      def index
        render_paginated Book, each_serializer: BookSerializer
      end

      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
