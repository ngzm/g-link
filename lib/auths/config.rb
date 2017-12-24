module Auths
  # Laod auth config
  module Config
    def conf
      @@conf ||= YAML.load_file(
        # File.join(Rails.root, 'config/rp_config_google.yml')
        File.join(Rails.root, 'config/rp_config_google_ngzm.yml')
      )
    end
  end
end
