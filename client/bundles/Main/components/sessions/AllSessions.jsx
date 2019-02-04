import React, { Component } from 'react'
import SessionCard from './SessionCard';

export class AllSessions extends Component {
	constructor(props) {
		super(props)
		this.state = {
			sessions: props.sessionlist.sessions,
			sessionType : props.sessionType,
			buttonName : props.buttonName,
			showDetails: false
		};
		this.showPage = this.showPage.bind(this);
	}

	showPage(event) {
		document.location.href = '/sessions/' + event.target.value;
	}
	render() {
		let allSessions = this.state.sessions.map(session => {
			if (session.status === this.state.sessionType) {
				return (
						<SessionCard session={session} buttonName={this.state.buttonName} showPage={this.showPage} />
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
