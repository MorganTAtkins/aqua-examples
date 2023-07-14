terraform {
  required_providers {
    aquasec = {
      version = "0.8.25"
      source  = "aquasecurity/aquasec"
    }
  }
}

provider "aquasec" {
    aqua_url = "https://eu-1.cloud.aquasec.com" // Alternatively sourced from $AQUA_URL
    username = var.aqua_username                // Alternatively sourced from $AQUA_USER
    password = var.aqua_password                // Alternatively sourced from $AQUA_PASSWORD

    // If you are using unverifiable certificates (e.g. self-signed) you may need to disable certificate verification
    verify_tls = true                           // Alternatively sourced from $AQUA_TLS_VERIFY

    // Alternatively, you can provide these configurations from a config file, and configure the provider as below
    // config_path = '/path/to/tf.config'
    // defaults to '~/.aqua/tf.config' -- Alternatively sourced from $AQUA_CONFIG
}