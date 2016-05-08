class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to '/', flash: {success: 'List created successfully'}
    else
      redirect_to '/', flash: {error: @list.errors}
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :list_items)
  end
end
