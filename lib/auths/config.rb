module Auths
  # Laod auth config
  module Config
    def conf
      @@conf ||= YAML.load_file(
        # File.join(Rails.root, 'config/rp_config_google.yml')
        File.join(Rails.root, 'config/rp_config_google_ngzm.yml')
      )
    end

    def fconf
      @@fconf ||= YAML.load_file(
        # File.join(Rails.root, 'config/rp_config_facebook.yml')
        File.join(Rails.root, 'config/rp_config_facebook_ngzm.yml')
      )
    end

    def tconf
      @@tconf ||= YAML.load_file(
        # File.join(Rails.root, 'config/rp_config_twitter.yml')
        File.join(Rails.root, 'config/rp_config_twitter_ngzm.yml')
      )
    end
  end
end
