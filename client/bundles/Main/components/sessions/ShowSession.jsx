import React, { Component } from 'react'
import SessionCard from './SessionCard';

export class ShowSession extends Component {
	constructor(props) {
		super(props)
		this.state = {
			session: props.session
		}
	}
	render() {
		return (
			<div  className='session_wrapper' >
				<SessionCard session={this.state.session} />
			</div>
		)
	}
}

export default ShowSession

