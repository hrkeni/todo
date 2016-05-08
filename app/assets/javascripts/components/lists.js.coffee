@Lists = React.createClass
  getInitialState: ->
    lists: @props.data
  getDefaultProps: ->
    lists: []
  render: ->
    React.DOM.div
      className: 'lists'
      for list in @state.lists
        React.createElement List, key: list.id, list: list
