module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!
      def index
        render_paginated user_get.rents, each_serializer: RentSerializer
      end

      def create
        new_rent = user_get.rents.new(rent_params)
        if new_rent.save
          render json: new_rent, serializer: RentSerializer, status: :created
        else
          render json: { errors: new_rent.errors }, status: :unprocessable_entity
        end
      end

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :start, :end)
      end

      def user_get
        User.find(params[:user_id])
      end
    end
  end
end
