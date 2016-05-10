@List = React.createClass
  getInitialState: ->
    title: ''
  handleChange: (e) ->
    @setState title: e.target.value
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
          React.createElement ListItem, key: item.id, item: item
        React.DOM.form
          className: 'form-inline'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'text'
              className: 'form-control input-sm'
              placeholder: 'Title'
              name: 'title'
              onChange: @handleChange
            React.DOM.input
              type: 'text'
              className: 'form-control input-sm'
              placeholder: 'Description'
              name: 'description'
            React.DOM.select
              className: 'form-control input-sm'
              name: 'state'
              React.DOM.option null, 'Not started'
              React.DOM.option null, 'In progress'
              React.DOM.option null, 'Completed'
            React.DOM.button
              type: 'submit'
              disabled: !@valid()
              className: 'btn btn-primary btn-sm'
              "Add"
  valid: ->
    @state.title
