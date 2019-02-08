import React, { Component } from 'react';
import SessionCard from './SessionCard';

export class ShowSession extends Component {
	constructor(props) {
		super(props);
		this.state = {
			session: props.session,
			coach: props.coach,
			members: props.members
		};
	this.buyStripe = this.buyStripe.bind(this);
	}

	buyStripe(){
		document.location.href = "/transactions/new" + "?sessionId=" + this.state.session.id;
	}

	render() {
		return (
			<div  className='main_container wrapper-col' >
				<SessionCard session={this.state.session} />
				<div className="text-white">
					{this.state.coach[0].first_name}
					{this.state.members.length}
				</div>

				<div>
				<button className='button' onClick={this.buyStripe}>
						Buy Session
				</button>
				</div>
			</div>
		);
	}
}

export default ShowSession;

