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
    lists[index]
    lists = React.addons.update(@state.lists[index], { $push: [item] })
    @setState records: records
  render: ->
    React.DOM.div
      className: 'lists'
      for list in @state.lists
        React.createElement List, key: list.id, list: list, handleDeleteList: @deleteList, handleAddItem: @addItem
