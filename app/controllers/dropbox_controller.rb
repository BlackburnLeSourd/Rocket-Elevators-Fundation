class DropboxController < ApplicationController

    def auth
        client = DropboxApi::Client.new(ENV["DROPBOX_OAUTH_BEARER"])
        
        puts client.get_current_account

    end

    # def setup
    #     client_id =l55gcir3fbyymql
    #     client_secret =zzbcq58cicg6dcg
    
    #     DropboxApi::Authenticator.new(client_id, client_secret)
    #     authenticator.auth_code.authorize_url
    #     access_token = authenticator.auth_code.get_token(params[:code])
    #     access_token.token
    # end

    # # Example call:
    # # GET /dropbox/auth
    # def auth
    #     # authenticator.auth_code.authorize_url
    #     # url = authenticator.auth_code.authorize_url :redirect_uri => "http://localhost:3000/"
    #     # puts url
    #     access_token = authenticator.auth_code.get_token('834Sa5M86yAAAAAAAAAA9gu_MX9JR651JcYu3rxgjXA', :redirect_uri => "http://localhost:3000/")
    #     puts access_token
    #     # uri = URI.parse(url)
    #     # tokenCode = uri.host.split('=').first
    #     # # auth = authenticator.auth_code.get_token(
    #     # #     params['code'], :redirect_uri => "http://localhost:3000/")
        
    #     # access_token = authenticator.auth_code.get_token(tokenCode)
    #     # access_token.token
        
    #     # client = DropboxApi::Client.new(access_token: access_token)
    #     # result = client.list_folder "/Rocket-Elevators-AI-folder"
    #     # puts result

    #     redirect_to "http://localhost:3000/"

    #     # uri = URI.parse(url)
    #     # uri.host.split('=').first
    #     # # auth = authenticator.auth_code.get_token(
    #     # #     params['code'], :redirect_uri => "http://localhost:3000/")
        
    #     # access_token = authenticator.auth_code.get_token(uri)
    #     # access_token.token
        
    #     # client = DropboxApi::Client.new(access_token: access_token)
    #     # result = client.list_folder "/Rocket-Elevators-AI-folder"
    #     # puts result
    # end


    # def useToken
        
        
    # end

    # # Example call:
    # # GET /dropbox/auth_callback?code=VofXAX8DO1sAAAAAAAACUKBwkDZyMg1zKT0f_FNONeA
    # def auth_callback
    #     auth_bearer = authenticator.get_token(params[:code],
    #                                         :redirect_uri => "/")
    #     token = auth_bearer.token # This line is step 5 in the diagram.

    #     # At this stage you may want to persist the reusable token we've acquired.
    #     # Remember that it's bound to the Dropbox account of your user.

    #     # If you persist this token, you can use it in subsequent requests or
    #     # background jobs to perform calls to Dropbox API such as the following.
    #     folders = DropboxApi::Client.new(token).list_folder "/"
    # end

    # private

    # def authenticator
    #     client_id = 'l55gcir3fbyymql'
    #     client_secret = 'zzbcq58cicg6dcg'


    #     DropboxApi::Authenticator.new(client_id, client_secret)
    # end

    # def redirect_uri
    #     dropbox_auth_callback_url # => http://localhost:3000/dropbox/auth_callback
    # end



end