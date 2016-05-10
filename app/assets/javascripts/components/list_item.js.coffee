@ListItem = React.createClass
  render: ->
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
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
