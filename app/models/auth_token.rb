#
# Auth tokens model class
#
class AuthToken < ApplicationRecord
  validates :client_token, presence: true, uniqueness: true
  validates :id_token, uniqueness: true, allow_nil: true
  validates :redirect_uri, presence: true
  validates :provider, presence: true

  def self.create_or_update(auth_token_data)
    atoken = AuthToken.find_by(client_token: auth_token_data[:client_token])
    if atoken.nil?
      atoken = AuthToken.create!(auth_token_data)
    else
      atoken.update!(auth_token_data)
    end
    atoken
  end

  def self.update_only(auth_token_data)
    atoken = AuthToken.find_by(client_token: auth_token_data[:client_token])
    raise 'client_token is NOT FOUND' if atoken.nil?
    atoken.update!(auth_token_data)
    atoken
  end
end
