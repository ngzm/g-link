#
# Auth tokens model class
#
class AuthToken < ApplicationRecord
  validates :client_token, presence: true, uniqueness: true
  validates :id_token, uniqueness: true, allow_nil: true
  validates :redirect_uri, presence: true
  validates :provider, presence: true

  def self.create_or_update(client_token, redirect_uri, provider)
    atoken = AuthToken.find_by(client_token: client_token)
    if atoken.nil?
      atoken = AuthToken.create!(client_token: client_token,
                                 redirect_uri: redirect_uri,
                                 provider: provider)
    else
      atoken.update!(redirect_uri: redirect_uri, provider: provider)
    end
    atoken
  end
end
