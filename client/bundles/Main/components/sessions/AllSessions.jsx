import React, { Component } from 'react'

export class AllSessions extends Component {
	constructor(props) {
		super(props)
		this.state = {
			sessions: props.sessionlist.sessions,
			sessionType : props.sessionType,
			buttonName : props.buttonName,
			showDetails: false
		}
		this.toggleShowDetails = this.toggleShowDetails.bind(this);
		this.buyStripe = this.buyStripe.bind(this);

	}

	toggleShowDetails() {
		event.preventDefault();
		this.setState({
			showDetails: !showDetails,
		});
	}

	buyStripe(){
		document.location.href = "/transactions/new";
	}

	render() {
		let allSessions = this.state.sessions.map(session => {
			if (session.status == this.state.sessionType) {
				return (
					<div id={session.id} className="wrapper">
						<div className='session'>
							<h1 className="session_name">{session.title}</h1>
							<p>{new Date(session.start_date).toLocaleString('en-GB', { h12: false })}</p>
						</div>
						<div style={this.state.buttonName ? {} : { display: "none" }} >
							<button onClick={this.toggleShowDetails(session.id)} className="button">{this.state.buttonName}</button>
						</div>
						<div style={this.state.showDetails ? {} : { display: "none" }}>
							<button
								className="button m-4"
								onClick={this.buyStripe}
							>
								Buy session
							</button>
						</div>
					</div>
				);
			}
		});
		return (
			<div id={this.state.sessionType}>
				<h1>{this.state.sessionType} sessions</h1>
				<div className='session_wrapper'>
					<div>{allSessions}</div>
				</div>
				<br />
			</div>)
	}
}

export default AllSessions
