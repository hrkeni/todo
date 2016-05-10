class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists.includes(:list_items)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to '/', flash: {success: 'List created successfully'}
    else
      flash.now[:error] = @list.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def destroy
    @list = List.find_by(id: params[:id], user_id: current_user.id)
    if @list
      @list.destroy
      head :no_content
    else
      head :bad_request
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :list_items)
  end
end
