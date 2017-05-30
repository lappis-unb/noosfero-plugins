module TccPluginHelper

  def tcc_login_url
    options = Noosfero.url_options.merge({ :controller => 'account', :action => 'login' })
    url_for(options)
  end
end
