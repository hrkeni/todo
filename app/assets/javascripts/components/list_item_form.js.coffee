@ListItemForm = React.createClass
  getInitialState: ->
    itemState = @props.item.state
    if itemState is 'Not started'
      itemState = 'not_started'
    else if itemState is 'In progress'
      itemState = 'in_progress'
    else if itemState is 'Completed'
      itemState = 'completed'
    else
      itemState = 'not_started'
    title: @props.item.title
    description: @props.item.description
    state: itemState
    id: @props.item.id
  render: ->
    React.DOM.form
      className: 'form-inline'
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control input-sm'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
        React.DOM.input
          type: 'text'
          className: 'form-control input-sm'
          placeholder: 'Description'
          name: 'description'
          value: @state.description
          onChange: @handleChange
        React.DOM.select
          className: 'form-control input-sm'
          name: 'state'
          onChange: @handleChange
          value: @state.state
          React.DOM.option
            value: 'not_started'
            'Not started'
          React.DOM.option
            value: 'in_progress'
            'In progress'
          React.DOM.option
            value: 'completed'
            'Completed'
        React.DOM.button
          type: 'submit'
          disabled: !@valid()
          onClick: @handleSubmit
          className: 'btn btn-primary btn-sm'
          "#{@props.submitText}"
  valid: ->
    @state.title
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    @props.onItemSubmit(@state.id, @state)
    @setState @getInitialState()
