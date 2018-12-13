module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!, :set_locale
      def index
        authorize user_get.rents[0]
        render_paginated user_get.rents, each_serializer: RentSerializer
      end

      def create
        new_rent = user_get.rents.new(rent_params)
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

      def set_locale
        I18n.locale = current_user.try(:locale) || I18n.default_locale
      end

      def user_get
        User.find(params[:user_id])
      end
    end
  end
end
