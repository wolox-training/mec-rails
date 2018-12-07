module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!
      def index
        user = User.find(params[:user_id])
        render_paginated user.rents, each_serializer: RentSerializer
      end

      def create
        user = User.find(params[:user_id])
        new_rent = user.rents.new(create_rent_params)
        if new_rent.save
          render json: new_rent, serializer: RentSerializer, status: :created
        else
          render json: { errors: new_rent.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
