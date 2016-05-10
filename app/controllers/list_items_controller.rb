class ListItemsController < ApplicationController
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

  private

  def list_item_params
    params.require(:list_item).permit(:title, :description, :state, :id)
  end
end
