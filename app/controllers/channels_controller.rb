class ChannelsController < ApplicationController
  before_action :check_current_user
  before_action :set_channel, only: %i[show edit update destroy invite confirm_invite]
  before_action :set_users_channel, only: %i[show confirm_invite]
  before_action :check_owner, only: :update

  def index
    @channels = current_user.channels
    channel_ids = current_user.users_channels.accepted.pluck(:channel_id)
    @sub_channels = Channel.where(id: channel_ids)
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = current_user.channels.new(channel_params)

    if @channel.save
      redirect_to(channels_path)
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def show; end

  def edit; end

  def update
    @channel.update channel_params

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @channel.destroy
    redirect_to channels_path
  end

  def confirm_invite
    @users_channel.send("#{params[:confirm]}!") if @users_channel && @users_channel.waiting?
 
    redirect_to @channel
  end


  def invite
    @user = User.find_by(email: params[:email])

    check_invite_channel if @user.present? && @user.id != current_user.id

    respond_to do |format|
      format.js
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name, :avatar, :detail)
  end

  def set_channel
    @channel = Channel.find_by(id: params[:id])
  end

  def check_owner
    redirect_to root_path unless @channel.user_id == current_user.id
  end

  def set_users_channel
    @users_channel = current_user.users_channels.find_by(channel_id: params[:id])
  end

  def check_invite_channel
    users_channel = UsersChannel.find_by(user_id: @user.id, channel_id: params[:id])

    if users_channel
      return error = true if users_channel.waiting?
      users_channel.waiting! if users_channel.rejected?
    else
      users_channel = UsersChannel.create(user_id: @user.id, channel_id: params[:id])
    end

    if users_channel.waiting? && !error
      NotificationService.new(to_user: @user, channel: @channel,
        from_user: current_user, key: "invite_channel").perform
    end
  end
end
