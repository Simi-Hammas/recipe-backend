class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'simihammas123')
  end
end
