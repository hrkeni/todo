@Lists = React.createClass
  getInitialState: ->
    lists: @props.data
  getDefaultProps: ->
    lists: []
  deleteList: (list) ->
    lists = @state.lists.slice()
    index = lists.indexOf list
    lists.splice index, 1
    @replaceState lists: lists
  addItem: (list_id, item) ->
    lists = @state.lists
    for list in lists
      if list.id is list_id
        index = lists.indexOf(list)
    list_items = React.addons.update(@state.lists[index].list_items, { $push: [item] })
    lists[index].list_items = list_items
    @setState lists: lists
  editItem: (list_id, item) ->
    lists = @state.lists
    for list in lists
      if list.id is list_id
        listIndex = lists.indexOf(list)
    itemIndex = @state.lists[listIndex].indexOf(item)
    lists[itemIndex].list_items = list_items
    @setState lists: lists
  render: ->
    React.DOM.div
      className: 'lists'
      for list in @state.lists
        React.createElement List, key: list.id, list: list, handleDeleteList: @deleteList, handleAddItem: @addItem, handleEditItem: @editItem
