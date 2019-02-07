import React, { Component } from 'react'
import SessionCard from './SessionCard';

export class AllSessions extends Component {
	constructor(props) {
		super(props)
		this.state = {
			sessions: props.sessionlist.sessions.sessions,
			sessionType : props.sessionType,
			buttonName : "",
			showDetails: false,
			user: props.sessionlist.sessions.user
		};
		this.showPage = this.showPage.bind(this);
	}

	componentDidMount() {
		let user = this.state.user;
		let availability = this.state.sessionType;
		
		if (user) {
			if (user.role === "coach" && availability === "booked" || availability === "full") {
				this.setState({ buttonName: "Start" });
			} else if (user.role === "trainee" && availability === "available") {
				this.setState({ buttonName: "Book" });
			} else {
				this.setState({ buttonName: "Join" });
			}
		}
	}

	showPage(event) {
		let user = this.state.user;

		if (user.role === "trainee") {
			document.location.href = '/sessions/' + event.target.value;
		} else if (user.role === "coach") {
			document.location.href = '/videocall';
		}
	}

	render() {
		let allSessions = this.state.sessions.map(session => {
			if (session.status === this.state.sessionType) {
				return (
					<SessionCard session={session} user={this.state.user} buttonName={this.state.buttonName} showPage={this.showPage} />
				);
			}
		});

		return (
			<div id={this.state.sessionType}>
				<h1 className="capitalize">{this.state.sessionType} sessions</h1>
				<div className='session_wrapper'>
					<div>{allSessions}</div>
				</div>
				<br />
			</div>);
	}
}

export default AllSessions;
