# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_earthquake_event, only: [:index]

      def index
        render json: CommentsBlueprint.render(@earthquake_event.comments)
      end

      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render json: CommentsBlueprint.render(@comment), status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      private

      def set_earthquake_event
        @earthquake_event = EarthquakeEvent.find(params[:earthquake_event_id])
      end

      def comment_params
        params.require(:comment).permit(:earthquake_event_id, :body)
      end
    end
  end
end
