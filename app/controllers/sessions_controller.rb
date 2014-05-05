class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login_id: params[:login_id])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'ログインに成功しました'
      redirect_to root_path
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render 'new'
    end
  end
end
