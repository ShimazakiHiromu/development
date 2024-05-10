class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password])

    if user
      redirect_to root_url, notice: 'ログインに成功しました。'
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
