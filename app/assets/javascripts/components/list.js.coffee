@List = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "lists/#{@props.list.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteList @props.list
  handleAddItem: (item_id, item) ->
    $.post '/list_items', {list_item: item, list_id: @props.list.id}, (data) =>
      @props.handleAddItem @props.list.id, data
    , 'JSON'
  handleEditItem: (item) ->
    @props.onEdit @props.list.id, item
  handleDeleteItem: (item) ->
    @props.onDeleteItem @props.list.id, item
  render: ->
    React.DOM.div
      className: 'panel panel-default'
      React.DOM.div
        className: 'panel-heading'
        React.DOM.strong
          className: 'title'
          "#{@props.list.title}"
        React.DOM.span
          className: 'description'
          " - #{@props.list.description}"
        React.DOM.div
          className: 'btn-group-xs'
          React.DOM.a
            className: 'btn btn-primary'
            'Edit'
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleDelete
            'Delete'
      React.DOM.div
        className: 'panel-body'
        for item in @props.list.list_items
          React.createElement ListItem, key: item.id, item: item, onEdit: @handleEditItem, onDeleteItem: @handleDeleteItem
        React.createElement ListItemForm, onItemSubmit: @handleAddItem, item: {state: 'not_started'}, submitText: 'Add'
