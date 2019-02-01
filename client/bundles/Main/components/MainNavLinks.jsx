import React, { Component } from "react";
import { NavLink } from "react-router-dom";

export class MainNavLinks extends Component {
	render() {
		return (
			<div>
				<div>
					<NavLink
						style={this.props.user ? { display: "none" } : {}}
						className="button m-4"
						to="/register"
					>
						Sign up
					</NavLink>
					<NavLink
						style={this.props.user ? { display: "none" } : {}}
						className="button m-4"
						to="/login"
					>
						Login
					</NavLink>
					<button
						style={this.props.user ? {} : { display: "none" }}
						className="button m-4"
						onClick={this.props.logout}
					>
						Logout
					</button>
				</div>
			</div>
		);
	}
}

export default MainNavLinks;
