# frozen_string_literal: true

class TokenChecker
  # Generate a JWT token with payload and expiration
  def generate_token(payload, expiration)
    # Set expiration time
    exp = Time.now.to_i + expiration

    # Generate token with payload and expiration
    JWT.encode({ data: payload, exp: exp }, ENV.fetch('jwtsecret'), 'HS256')
  end

  # Check token validity and expiration
  def valid_token?(token)
    # Decode token and verify signature
    decoded_token = JWT.decode(token, ENV.fetch('jwtsecret'), true, { algorithm: 'HS256' })

    # Extract payload and expiration from decoded token
    exp = decoded_token[0]['exp']

    # Check token expiration
    Time.now.to_i <= exp
  rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
    false
  end

  # Get payload from JWT token
  def get_payload(token)
    # Decode token and verify signature
    decoded_token = JWT.decode(token, ENV.fetch('jwtsecret'), true, { algorithm: 'HS256' })
    # Extract payload from decoded token
    decoded_token[0]['data']
  rescue JWT::VerificationError, JWT::DecodeError
    nil
  end
end
