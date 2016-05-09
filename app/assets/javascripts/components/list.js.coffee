@List = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "lists/#{@props.list.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteList @props.list
  render: ->
    React.DOM.div
      className: 'panel panel-default'
      React.DOM.div
        className: 'panel-heading'
        "#{@props.list.title} - #{@props.list.description}"
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
        "asdf"
