import React from "react";
import { NavLink } from "react-router-dom";

function MainNavLinks(props) {
	return (

<div>
				<div>
					<NavLink
						style={props.user ? { display: "none" } : {}}
						className="button m-4"
						to="/register"
					>
						Register
					</NavLink>
					<NavLink
						style={props.user ? { display: "none" } : {}}
						className="button m-4"
						to="/login"
					>
						Login
					</NavLink>
					<button
						style={props.user ? {} : { display: "none" }}
						className="button m-4"
						onClick={props.logout}
					>
						Logout
					</button>
					<NavLink
						style={props.user && props.user.role === "coach" ? {} : { display: "none" }}
						className="button m-4"
						to="/addsession"
					>
						Add Session
					</NavLink>
				</div>
			</div>

	);
}

export default MainNavLinks


