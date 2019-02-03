import React, { Component } from "react";
import ReactOnRails from "react-on-rails";
import AddSessionForm from "./AddSessionForm";

const axios = require("axios");

export class Login extends Component {
	constructor(props) {
		super(props);
		this.state = {
			title: "",
			start_date: "",
			price_table_id: 1,
			formErrors: ""
		};
		this.onChange = this.onChange.bind(this);
		this.onSubmit = this.onSubmit.bind(this);
	}

	onSubmit() {
		event.preventDefault();
		const csrfToken = ReactOnRails.authenticityToken();
        let AddSessionForm = document.getElementById("Session-form");
		const data = new FormData(AddSessionForm);

		const config = {
			headers: {
				"Content-Type": "application/x-www-form-urlencoded",
				"X-CSRF-Token": csrfToken
			}
        };
        
		axios
			.post("/sessions", data, config)
			.then(response => {
				if (response.data.errors) {
					let errors = response.data.errors;
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

	onChange() {
		this.setState({
			[event.target.id]: event.target.value
		});
	}

	render() {
		return (
			<div className='main_container'>
				<div className="mt-4 text-center whitespace-pre-wrap" >{this.state.formErrors}</div>
				<AddSessionForm
					onSubmit={this.onSubmit}
					onChange={this.onChange}
					title={this.state.title}
					start_date={this.state.start_date}
					price_table_id={this.state.price_table_id}
                />
			</div>
		);
	}
}

export default Login;
