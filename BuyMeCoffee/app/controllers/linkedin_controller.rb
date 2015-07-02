class LinkedinController < ApplicationController
  @@config = {
    :site => 'https://api.linkedin.com',
    :authorize_path => '/uas/oauth/authenticate',
    :request_token_path => '/uas/oauth/requestToken?scope=r_basicprofile',
    :access_token_path => '/uas/oauth/accessToken'
  }


def index
    unless LinkedinOauthSetting.find_by_user_id(session[:user_id]).nil?
     redirect_to user_path(current_user)
    end
  end

  def linkedin_profile
    @basic_profile = get_basic_profile
    @positions = get_positions
  end

  def oauth_account
     @current_user = User.find(session[:user_id])
    client = LinkedIn::Client.new('77mq4feex7uxw7', 'CVF1DvzYJA8b7E77', @@config)
    pin = params[:oauth_verifier]
    if pin
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      LinkedinOauthSetting.create!(:asecret => asecret, :atoken => atoken, :user_id => session[:user_id] )
    end
    redirect_to user_path(id: session[:user_id])
  end

  def generate_linkedin_oauth_url
    if LinkedinOauthSetting.find_by_user_id(session[:user_id]).nil?
      client = LinkedIn::Client.new('77mq4feex7uxw7', 'CVF1DvzYJA8b7E77', @@config)
      request_token = client.request_token(:oauth_callback => "http://#{request.host}:#{request.port}/oauth_account")
      session[:rtoken] = request_token.token
      session[:rsecret] = request_token.secret
      redirect_to request_token.authorize_url
    else
      redirect_to "/oauth_account"
    end
  end

  private

  def get_client
    linkedin_oauth_setting = LinkedinOauthSetting.find_by_user_id(session[:user_id] )
    client = LinkedIn::Client.new('77mq4feex7uxw7', 'CVF1DvzYJA8b7E77', @@config)
    client.authorize_from_access(linkedin_oauth_setting.atoken, linkedin_oauth_setting.asecret)
    client
  end


  def get_basic_profile
    bprofile = BasicProfile.find_by_user_id(session[:user_id] )
    if bprofile.nil?
      client = get_client
      profile = client.profile(:fields => ["first-name", "last-name", "maiden-name", "formatted-name" ,:headline, :location, :industry, :summary, :specialties, "picture-url", "public-profile-url"])

      basic_profile = profile.to_hash
      basic_profile[:location] = basic_profile["location"]["name"]
      new_basic_profile = BasicProfile.new(basic_profile)
      new_basic_profile.user = User.find(session[:user_id])
      new_basic_profile.save
      new_basic_profile
    else
      bprofile
    end
  end


  def get_positions
   current_user = User.find(session[:user_id])
    positions = Position.where( basic_profile_id:current_user.basic_profile.id)
    if positions.empty?
      client = get_client
      positions = client.profile(:fields => [:positions]).positions.all
      positions.each do |p|
        if p.is_current == "true"
          Position.create(
            title: p.title,
            summary: p.summary,
            start_date: Date.parse("1/#{p.start_date.month ? p.start_date.month : 1}/#{p.start_date.year}"),
            end_date: Date.parse("1/#{p.end_date.month ? p.end_date.month : 1}/#{p.end_date.year}"),
            is_current: p.is_current,
            company: p.company.name,
            basic_profile_id: current_user.basic_profile.id)
        else
          Position.create(
            title: p.title,
            summary: p.summary,
            start_date: Date.parse("1/#{p.start_date.month ? p.start_date.month : 1}/#{p.start_date.year}"),
            is_current: p.is_current,
            company: p.company.name,
            basic_profile_id: current_user.basic_profile.id)
        end
      end
      current_user.basic_profile.positions
    else
      positions
    end
  end




end
