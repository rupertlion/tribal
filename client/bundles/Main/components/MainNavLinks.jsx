import React, { Component } from "react";
import { NavLink, Link } from 'react-router-dom'

export class MainNavLinks extends Component {
	render() {
		return (
			<div>
				<div>
					<NavLink className="button m-4" to="/register">
						Sign up
					</NavLink>
					<NavLink className="button m-4" to="/login">
						Login
					</NavLink>
					<button className="button m-4" onClick={this.props.logout}>Logout</button>
				</div>
			</div>
		);
	}
}

export default MainNavLinks;
