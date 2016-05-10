@ListItem = React.createClass
  getInitialState: ->
    edit: false
  render: ->
    if !@state.edit
      @listItemRow()
    else
      @listItemForm()
  handleEditItem: (item_id, item) ->
    $.ajax
      method: 'PUT'
      url: "/list_items/#{item_id}"
      dataType: 'JSON'
      data:
        list_item: item
      success: (data) =>
        @setState edit: false
        @props.onEdit data
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/list_items/#{@props.item.id}"
      dataType: 'JSON'
      success: (data) =>
        @props.onDeleteItem(@props.item)
  listItemRow: ->
    React.DOM.div
      className: 'list-item'
      React.DOM.strong
        className: 'title'
        "#{@props.item.title}"
      React.DOM.span
        className: 'description'
        " - #{@props.item.description}"
      React.DOM.span
        className: 'state'
        " (#{@props.item.state})"
      React.DOM.span
        className: 'btn-group-xs'
        React.DOM.a
          className: 'btn btn-primary'
          onClick: @toggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  listItemForm: ->
    React.createElement ListItemForm, onItemSubmit: @handleEditItem, item: @props.item, submitText: 'Update'
  toggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
