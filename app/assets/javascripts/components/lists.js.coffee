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
  handleDeleteItem: (list_id, item) ->
    lists = @state.lists
    for list in lists
      if list.id is list_id
        listIndex = lists.indexOf(list)
    for i in lists[listIndex].list_items
      if i.id is item.id
        itemIndex = lists[listIndex].list_items.indexOf(i)
    lists = React.addons.update(lists, {"#{listIndex}": { list_items: {$splice: [[itemIndex, 1]] } } })
    @setState lists: lists

  handleEditItem: (list_id, item) ->
    lists = @state.lists
    for list in lists
      if list.id is list_id
        listIndex = lists.indexOf(list)
    for i in lists[listIndex].list_items
      if i.id is item.id
        itemIndex = lists[listIndex].list_items.indexOf(i)
    lists = React.addons.update(lists, {"#{listIndex}": { list_items: { "#{itemIndex}": {$set: item } } } })
    @setState lists: lists
  render: ->
    React.DOM.div
      className: 'lists'
      for list in @state.lists
        React.createElement List, key: list.id, list: list, handleDeleteList: @deleteList, handleAddItem: @addItem, onEdit: @handleEditItem, onDeleteItem: @handleDeleteItem
