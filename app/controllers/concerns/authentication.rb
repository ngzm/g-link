# module of user authentication
module Authentication
  # Exchange from client_token to id_token
  def from_client_to_id_token(client_token)
    auth_token = AuthToken.find_by(client_token: client_token)
    if auth_token.nil? || auth_token.id_token.blank?
      raise Auths::Error::Unauthorized, 'client_token is not found'
    end
    auth_token.id_token
  end

  # Authenticate id_token
  def authenticate_id_token(id_token)
    auth_token = AuthToken.find_by(id_token: id_token)
    raise Auths::Error::Unauthorized, 'id_token is not found in auth_tokens' \
      if auth_token.nil?

    email = inspect_id_token(id_token, 'google')
    user = User.find_by(email: email)
    raise Auths::Error::Unauthorized, 'User is not found' \
      if user.nil?

    user
  end

  # Validate id_token according to id_token provider
  # Get user email from id_token
  def inspect_id_token(id_token, provider = 'google')
    authenticator = Auths::Auth::AuthToken.authenticator(provider)
    authenticator.validate_id_token(id_token)
    authenticator.email_from_id_token(id_token)
  end
end
