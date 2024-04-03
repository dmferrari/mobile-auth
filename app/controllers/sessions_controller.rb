# frozen_string_literal: true

class SessionsController < ApplicationController
  def create # rubocop:disable Metrics/AbcSize
    user = User.find_or_create_by(provider: auth_hash['provider'], uid: auth_hash['uid']) do |u|
      u.first_name = auth_hash['info']['first_name']
      u.last_name = auth_hash['info']['last_name']
      u.email = auth_hash['info']['email']
    end
    session[:user_id] = user.id

    redirect_to root_path
  end

  def failure
    message = 'Authentication failed, please try again.'
    Rails.logger.error "Authentication error: #{message}"

    redirect_to root_path, alert: message
  end

  private

  def auth_hash
    @auth_hash ||= request.env['omniauth.auth']
  end
end
