class ChannelsController < ApplicationController
  before_action :check_current_user
  before_action :set_channel, only: %i[show edit update destroy]
  before_action :check_owner, only: :update

  def index
    @channels = current_user.channels
    @sub_channels = current_user.sub_channels
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

  def invite
    @user = User.find_by(email: params[:email])
    UsersChannel.create(user_id: user.id, channel_id: params[:id]) 
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
end
