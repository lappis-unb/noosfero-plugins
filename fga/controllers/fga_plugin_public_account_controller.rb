class FgaPluginPublicAccountController < AccountController

  def tcc_login
    store_location(request.referer) unless params[:return_to] or session[:return_to]

    return unless request.post?

    self.current_user = plugins_alternative_authentication

    begin
      self.current_user ||= User.authenticate(params[:user][:login], params[:user][:password], environment) if params[:user]
    rescue User::UserNotActivated => e
      session[:notice] = e.message
      return
    end
    if logged_in?
      check_join_in_community(self.current_user)

      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = {value: self.current_user.remember_token, expires: self.current_user.remember_token_expires_at}
      end

      if redirect?
        go_to_initial_page
        session[:notice] = _("Logged in successfully")
      end
    else
      session[:notice] = _('Incorrect username or password') if redirect?
    end
  end

end
