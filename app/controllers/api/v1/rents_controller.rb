module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!
      def index
        render_paginated Rent.where(user_id: params[:user_id]), each_serializer: RentSerializer
      end

      def create
        rent_data = params[:rent]
        rent = Rent.create(user_id: rent_data[:user_id], book_id: rent_data[:book_id],
                           start: rent_data[:start], end: rent_data[:end])
        render json: rent, status: :created
      end
    end
  end
end
