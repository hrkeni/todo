class ListItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    if !@list
      render json: 'No such list', status: :unprocessable_entity
    end
    @list_item = ListItem.new(list_item_params)
    @list_item.list = @list
    if @list_item.save
      render json: @list_item
    else
      render json: @list_item, status: :unprocessable_entity
    end
  end

  def update
    @list_item = ListItem.find(params[:id])
    if @list_item.update(list_item_params)
      render json: @list_item
    else
      render json: @list_item, status: :unprocessable_entity
    end
  end

  def destroy
    @list_item = ListItem.find_by(id: params[:id])
    if @list_item
      @list_item.destroy
      head :no_content
    else
      head :bad_request
    end
  end

  private

  def list_item_params
    params.require(:list_item).permit(:title, :description, :state, :id)
  end
end
