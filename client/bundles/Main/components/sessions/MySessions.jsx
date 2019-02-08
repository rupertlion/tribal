import React, { Component } from 'react'

export class MySessions extends Component {
	constructor(props){
		super(props)
		this.state = {
			user: props.user,
			mysessions: props.mysessions
		}
		this.showPage = this.showPage.bind(this)
	}

	showPage(event) {
		let user = this.state.user;
		if (user.role === "trainee") {
			document.location.href = '/sessions/' + event.target.value;
		} else if (user.role === "coach") {
			document.location.href = '/startsession';
		}
	}
	render() {
		let mySessions = this.state.mysessions.map(session => {
			if (session.status === this.state.sessionType) {
				return (
					<SessionCard session={session} user={this.state.user} buttonName='Join' showPage={this.showPage} />
				);
			}
		});
		return (
			<div>
				{mySessions}
			</div>
		)
	}
}

export default MySessions
