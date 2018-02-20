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

    payload = validate_id_token(id_token, auth_token.client_token)

    identifer = payload['ident']
    user = User.find_by(identifer: identifer)
    raise Auths::Error::Unauthorized, 'User is not found' if user.nil?

    user
  end

  # valiadte id_token payload
  def validate_id_token(id_token, client_token)
    idt = Auths::Auth::IdToken.new(client_token)
    payload = idt.decode_id_token(id_token)
    idt.validate_id_token_payload(payload)
    payload
  end
end
