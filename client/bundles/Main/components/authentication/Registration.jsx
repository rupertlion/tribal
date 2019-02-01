import React, { Component } from "react";
import ReactOnRails from "react-on-rails";
import RegistrationForm from "./RegistrationForm";

const axios = require("axios");

export class Registration extends Component {
	constructor(props) {
		super(props);
		this.state = {
			role: "",
			first_name: "",
			last_name: "",
			email: "",
			password: "",
			password_confirmation: "",
			roleChoiceStatus: false,
			formErrors: ""
		};
		this.onChange = this.onChange.bind(this);
		this.onSubmit = this.onSubmit.bind(this);
		this.onRoleClick = this.onRoleClick.bind(this);
	}
	onSubmit() {
		event.preventDefault();
		const csrfToken = ReactOnRails.authenticityToken();
		let registrationForm = document.getElementById("Registration-form");
		const data = new FormData(registrationForm);
		const config = {
			headers: {
				"Content-Type": "application/x-www-form-urlencoded",
				"X-CSRF-Token": csrfToken
			}
		};
		axios
			.post("/users", data, config)
			.then(response => {
				if (response.data.errors) {
					let errors = Object.entries(response.data.errors).join('\n').replace(/,|_/g, ' ');
					this.setState({
						formErrors: errors
					});
				} else {
					document.location.href = "/";
				}
			})
			.catch(function (error) {
				console.log(error);
			});
	}
	onClick(event) {
		event.preventDefault();
		this.setState({
			[event.target.id]: event.target.value
		});
	}

	onChange() {
		this.setState({
			[event.target.id]: event.target.value
		});
	}
	onRoleClick() {
		event.preventDefault();
		this.setState(prevState => ({
			roleChoiceStatus: !prevState.roleChoiceStatus,
			role: event.target.value,
			formDisplayStatus: !prevState.roleChoiceStatus
		}));
	}

	render() {
		return (
			<div className="main_container">
				<div style={this.state.roleChoiceStatus ? { display: "none" } : {}}>
					<h1>I am a</h1>
					<div className="content wrapper">
						<button className="button" name="role" value="0" onClick={this.onRoleClick}>
							Trainee
						</button>
						<button className="button" name="role" value="1" onClick={this.onRoleClick}>
							Coach
						</button>
					</div>
				</div>
				<div style={this.state.roleChoiceStatus ? {} : { display: "none" }}>
					<div className="mt-4 text-center" style={{ whiteSpace: 'pre-wrap' }}>{this.state.formErrors}</div>
					<RegistrationForm
						onSubmit={this.onSubmit}
						onChange={this.onChange}
						first_name={this.state.first_name}
						last_name={this.state.last_name}
						email={this.state.email}
						password={this.state.password}
						password_confirmation={this.state.password_confirmation}
						role={this.state.role}
					/>
				</div>
			</div>
		);
	}
}

export default Registration;
