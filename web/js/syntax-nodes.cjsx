rce = (kind,props)-> React.createElement kind, props

Syn = (ast)->
  switch ast.tag
    when "prog" then rce ProgramNode, ast
    else console.log "unknown tag: #{ast.tag}"


InsertionPoint = React.createClass
  render: ->
    <span>
      {Syn(x) for x in @props.nodes}
      <button>{@props.kind}</button>
    </span>


Iden = React.createClass
  render: ->
    self = this
    <input type="text" width="16" value={@props.node.iden}
      onChange={ (e) ->
        self.props.node.iden = e.target.value
        self.forceUpdate() } />


Program = React.createClass
  render: ->
    <code className="program">
      <kw>program</kw> <Iden node={@props.name}/>;
        <div>
         <InsertionPoint nodes={@props.decls}  kind="decl"/>
        </div>
      <kw>begin</kw>
        <suite>
          <InsertionPoint nodes={@props.suite}  kind="stmt"/>
        </suite>
      <kw>end</kw>.
    </code>
