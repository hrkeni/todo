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
  render: ->
    React.DOM.div
      className: 'lists'
      for list in @state.lists
        React.createElement List, key: list.id, list: list, handleDeleteList: @deleteList
