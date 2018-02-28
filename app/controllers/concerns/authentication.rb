# module of user authentication
module Authentication
  # Exchange from client_token to id_token
  def from_client_to_id_token(client_token)
    auth_token = AuthToken.find_by(client_token: client_token)
    if auth_token.nil? || auth_token.id_token.blank?
      raise Auths::Error::Unauthorized, 'client_token is not found'
    end
    #
    # TODO: ここで古いレコードをdeleteする！
    #
    auth_token.id_token
  end

  # Authenticate id_token
  def authenticate_id_token(id_token)
    payload = Auths::IdToken.validate(id_token)
    user = User.find_by(identifer: payload['sub'])
    raise Auths::Error::Unauthorized, 'User is not found' if user.nil?
    user
  end
end
