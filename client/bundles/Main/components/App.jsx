import React from "react";
import { Route, Switch, BrowserRouter } from "react-router-dom";
import Main from "./Main";
import Registration from "./Registration";
import Login from "./Login";


export class App extends React.Component {
	constructor(props) {
		super(props)
		this.state = {
			sessions: props
		}
	}

	componentDidMount(){
		this.setState({
			sessions: this.props
		})
	}
	render() {
		return (
			<div>
			<BrowserRouter>
			<Switch>
				<Route exact path ='/' render={() => <Main sessions={this.state.sessions} />} />;
				<Route exact path ='/register' render={() => <Registration />} />;
				<Route exact path ='/login' render={() => <Login />} />;
			</Switch>
		</BrowserRouter>
		</div>
		)
	}
}

export default App

