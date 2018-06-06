module Api
  # Send contact mail to admin and user
  class ContactsController < ApiController
    before_action :contact_params, only: %i[create]
    skip_before_action :authenticated?

    @encryptor = ::ActiveSupport::MessageEncryptor.new(
      SecureRandom.hex(16),
      cipher: 'aes-256-cbc'
    )
    BASE_TOKEN = 'freegame.link.base.token'.freeze
    SEPARATOR = '__s_e_p_a_r_a_t_o_r__'.freeze
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    class << self
      def encripter(message)
        @encryptor.encrypt_and_sign(message)
      end

      def decripter(encripted)
        @encryptor.decrypt_and_verify(encripted)
      end
    end

    def new
      @token = self.class.encripter(contact_token)
      render 'new', formats: 'json', handlers: 'jbuilder'
    end

    def create
      verify_params

      ContactMailer.contact_mail(@contact).deliver_now
      render 'create', formats: 'json', handlers: 'jbuilder'
    end

    private

    def contact_params
      params[:contact] = JSON.parse(request.body.read, symbolize_names: true)
      @contact = params.require(:contact).permit(:token, :name, :email, :ask)
    end

    def verify_params
      verify_name(@contact[:name])
      verify_email(@contact[:email])
      verify_ask(@contact[:ask])
      verify_contact_token self.class.decripter(@contact[:token])
    end

    def verify_name(name)
      raise BadRequest, 'Invalid name' if name.nil?
    end

    def verify_email(email)
      raise BadRequest, 'Invalid email' if email.nil?
      raise BadRequest, 'Invalid email' if email !~ VALID_EMAIL_REGEX
    end

    def verify_ask(ask)
      raise BadRequest, 'Invalid ask' if ask.nil?
    end

    def verify_contact_token(token)
      /^#{BASE_TOKEN}#{SEPARATOR}(.+)$/ =~ token
      begin_time = Regexp.last_match(1)
      raise BadRequest, 'Invalid token' if begin_time.nil?
    end

    def contact_token
      "#{BASE_TOKEN}#{SEPARATOR}#{Time.now.to_i}"
    end
  end
end
