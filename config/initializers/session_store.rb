Rails.application.config.session_store :cookie_store, key: "_projects_saas_session", domain: :all, tld_length: 3, secure: Rails.env.production?
