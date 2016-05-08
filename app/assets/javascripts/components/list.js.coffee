@List = React.createClass
  render: ->
    React.DOM.div
      className: 'panel panel-default'
      React.DOM.div
        className: 'panel-heading'
        "#{@props.list.title} - #{@props.list.description}"
      React.DOM.div
        className: 'panel-body'
        "asdf"
