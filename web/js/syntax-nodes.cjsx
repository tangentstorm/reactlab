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

ProgramNode = React.createClass
  render: ->
    <code className="program">
      <kw>program</kw> <span className="iden">{@props.name}</span>;
        <div>
         <InsertionPoint nodes={@props.decls}  kind="decl"/>
        </div>
      <kw>begin</kw>
        <suite>
          <InsertionPoint nodes={@props.suite}  kind="stmt"/>
        </suite>
      <kw>end</kw>.
    </code>
