HelloReact = React.createClass
  render: ->
    <div className="hello-react">
      <h1>Hello, {@props.name}</h1>
      <p>
      {<span key={n}>This line has been printed {n} times<br/></span> for n in [1..5]}
      </p>
    </div>
