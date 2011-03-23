class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user])
    @user_session.save() ? successful(@user_session) : unsuccessful;
  end

  def destroy
    current_user_session.destroy if current_user_session
    render :json => { :success => true }
  end

  private

  def successful(session)
    render :json => { :name => session.user.fl_name, :success => true }
  end

  def unsuccessful
    render :json => { :success => false }
  end
end
