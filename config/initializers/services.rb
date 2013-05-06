config = YAML.load(File.read(File.join(Rails.root, "/config/service_config.yml"))) rescue nil
CONFIG = config ? config[Rails.env] : {}