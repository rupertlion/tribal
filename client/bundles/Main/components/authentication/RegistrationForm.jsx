import React from "react";

export default function RegistrationForm(props) {
	return (
		<div className="main_container">
			<h1 className="m-4">Register</h1>
			<form
				id="Registration-form"
				name="Registration-form"
				onSubmit={props.onSubmit}
				className="wrapper-col"
			>
				<label htmlFor="First name">First name</label>
				<input
					onChange={props.onChange}
					value={props.first_name}
					id="first_name"
					name="first_name"
					type="text"
				/>
				<label htmlFor="Last name">Last name</label>
				<input
					onChange={props.onChange}
					value={props.last_name}
					id="last_name"
					name="last_name"
					type="text"
				/>
				<label htmlFor="Email">Email</label>
				<input
					onChange={props.onChange}
					value={props.email}
					id="email"
					name="email"
					type="email"
				/>
				<label htmlFor="password">Password</label>
				<input
					onChange={props.onChange}
					value={props.password}
					id="password"
					name="password"
					type="password"
				/>
				<label htmlFor="password_confirmation">Password Confirmation</label>
				<input
					onChange={props.onChange}
					value={props.password_confirmation}
					id="password_confirmation"
					name="password_confirmation"
					type="password"
				/>
				<input style={{ display: 'none' }} id="role" name="role" value={props.role} />
				<button className="button" name="Submit" type="submit">
					Submit
				</button>
			</form>
		</div>
	);
}
