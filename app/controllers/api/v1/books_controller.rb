module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
      # GET /books
      def index
        render_paginated Book
      end

      # GET /books/:id
      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
