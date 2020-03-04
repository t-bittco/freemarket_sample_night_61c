# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end
  
  def after_sign_up_path_for(resource)
    addresses_new_path
  end

  def after_inactive_sign_up_path_for(resource)
    addresses_new_path
  end

  def step1
    @user = User.new
    # session[:provider] = session[:provider]
    # session[:uid] = session[:uid]
  end

  def step2
    
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:password_confirmation] = params[:user][:password_confirmation]
    session[:f_name_kana] = params[:user][:f_name_kana]
    session[:l_name_kana] = params[:user][:l_name_kana]
    session[:f_name_kanji] = params[:user][:f_name_kanji]
    session[:l_name_kanji] = params[:user][:l_name_kanji]
    session[:birth_day] = birth_day_join
    @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birth_day: session[:birth_day], telephone: params[:user][:telephone])
  end

  def create
    # if session[:provider].present? && session[:uid].present?#もしoath認証されていたら
    #   password = Devise.friendly_token.first(7)
    #   @user = User.create(nickname:session[:nickname], email: session[:email], password: "password", password_confirmation: "password", f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birth_day: session[:birth_day], tel: params[:user][:telephone])
    #   sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
    # else#email認証だったら
    @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birth_day: session[:birth_day], telephone: params[:user][:telephone])
    # end

  
    
    
    if @user.save
      redirect_to controller: '/addresses', action: 'step3'
      sign_in(@user)
      bypass_sign_in(@user)
    else
      render "step1"
    end
    # @user.save
    # redirect_to controller: '/addresses', action: 'step3'
    # sign_in(@user)
    # bypass_sign_in(@user)
    
    
    
  end

  private
  def birth_day_join
    year = params[:user]["birth_day(1i)"]
    month = params[:user]["birth_day(2i)"]
    day = params[:user]["birth_day(3i)"]
    birth_day = year.to_s + "-" + month.to_s + "-" + day.to_s
    return birth_day
  end

  def customize_sign_up_params
    devise_parameter_sanitizer.permit :sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me]
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
