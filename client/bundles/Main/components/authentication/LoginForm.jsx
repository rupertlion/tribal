import React from 'react';

export default function LoginForm(props) {
    return (
      <div className="main_container">
				<h1 className="m-4">Login</h1>
				<form
					id="Login-form"
					name="Login-form"
					onSubmit={props.onSubmit}
					className="wrapper-col"
				>
					<label htmlFor="Email">Email</label>
					<input
						onChange={props.onChange}
						value={props.email}
						id="email"
						name="user[email]"
						type="email"
						className="m-4"
					/>
					<label htmlFor="password">Password</label>
					<input
						onChange={props.onChange}
						value={props.password}
						id="password"
						name="user[password]"
						type="password"
						className="m-4"
					/>
					<button className="button" name="Submit" type="submit">
						Log in
					</button>
				</form>
			</div>
    );
}
