module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!
      def index
        user = User.find(params[:user_id])
        authorize user.rents[0]
        render_paginated user.rents, each_serializer: RentSerializer
      end

      def create
        user = User.find(params[:user_id])
        new_rent = user.rents.new(rent_params)
        authorize new_rent
        if new_rent.save
          RentMailer.new_rent_created(new_rent.id).deliver_later
          render json: new_rent, serializer: RentSerializer, status: :created
        else
          render json: { errors: new_rent.errors }, status: :unprocessable_entity
        end
      end

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :start, :end)
      end
    end
  end
end
