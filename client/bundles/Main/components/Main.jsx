import React from "react";
import AllSessions from "./AllSessions";
import { NavLink, Link } from 'react-router-dom'

const axios = require("axios");
export default class Main extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			availableSessions: props.sessions.availableSessions,
			bookedSessions: props.sessions.bookedSessions,
			fullSessions: props.sessions.fullSessions,
			user: props.sessions.user
		};
		this.logout = this.logout.bind(this)
	}

	componentWillMount() {
		this.setState({
			availableSessions: this.props.sessions.availableSessions,
			bookedSessions: this.props.sessions.bookedSessions,
			fullSessions: this.props.sessions.fullSessions,
			user: this.props.sessions.user
		})
	}

	logout() {
		event.preventDefault();
		const csrfToken = ReactOnRails.authenticityToken();
		const config = {
			headers: {
				"Content-Type": "application/json",
				"X-CSRF-Token": csrfToken
			}
		};
		axios.delete(
			"/users/sign_out", config
		).then((response) => {
			document.location.href = "/";
		}).catch(function (error) {
			console.log(error);
		})

		// axios
		// 	.delete("/users/sign_out", config)
		// 	.then(response => {
		// 		if (response.data.errors) {
		// 			let errors = Object.entries(response.data.errors).join('\n').replace(/,|_/g, ' ');
		// 			this.setState({
		// 				formErrors: errors
		// 			})
		// 		} else {
		// 			document.location.href = "/";
		// 		}


		// 	})
		// 	.catch(function (error) {
		// 		console.log(error);
		// 	});
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
							<button onClick={this.logout}>
								Logout
						</button>
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
