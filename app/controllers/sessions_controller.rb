class SessionsController < ApplicationController
  def new
  end

  def create
    # 正しいキーでログイン試行
    email = params.dig(:session, :email) || params[:email]
    password = params.dig(:session, :password) || params[:password]

    user = login(email, password)

    if user
      redirect_to calendar_path, notice: 'ログインに成功しました。'
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが間違っています。'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'ログアウトしました。'
  end
end