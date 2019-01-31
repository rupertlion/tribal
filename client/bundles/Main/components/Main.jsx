import React from "react";
import AllSessions from "./AllSessions";
import { NavLink, Link } from 'react-router-dom'
export default class Main extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			availableSessions: props.sessions.availableSessions,
			bookedSessions: props.sessions.bookedSessions,
			fullSessions: props.sessions.fullSessions,
			user: props.sessions.user
		};
	}

	componentWillMount() {
		this.setState({
			availableSessions: this.props.sessions.availableSessions,
			bookedSessions: this.props.sessions.bookedSessions,
			fullSessions: this.props.sessions.fullSessions,
			user: this.props.sessions.user
		})
	}

	render() {
		return (
			<div className='main_container'>
				<div className='header'>
					<img src="./assets/logo.png" id="logo" alt="logo" />
					<p id="title">Tribal</p>
				</div>
				<div className='wrapper-col content'>
				</div>
				<div className='content'>
					<div id='available'>
					<div className="wrapper-col">
						<NavLink className="button m-4" to='/register'>
							Sign up
						</NavLink>
						<NavLink className="button m-4" to='/login'>
							Login
						</NavLink>
						<h4 className="m-4">Hello, {this.state.user ? this.state.user.first_name : 'Stranger'}!</h4>
					</div>
						<h1>Available sessions</h1>
						<div className='session_wrapper'>
							<AllSessions sessionlist={this.state.availableSessions} />
						</div>
						<br />
					</div>
					<div id='booked'>
						<h1>Booked sessions</h1>
						<div className='session_wrapper'>
							<AllSessions sessionlist={this.state.bookedSessions} />
						</div>
						<br />
					</div>
					<div id='full'>
						<h1>Full sessions</h1>
						<div className='session_wrapper'>
							<AllSessions sessionlist={this.state.fullSessions} />
						</div>
					</div>
				</div>

				<div className='footer'>
					<p>FOOTER</p>
				</div>
			</div>
		);
	}
}
