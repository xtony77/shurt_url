Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, Setting.facebook_app_id, Setting.facebook_secret,
             :scope => 'email,user_work_history,user_mobile_phone,user_birthday'

    OmniAuth.config.on_failure = UserController.action(:failure)
end