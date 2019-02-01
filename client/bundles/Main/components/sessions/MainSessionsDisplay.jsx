import React from 'react';
import AllSessions from "./AllSessions";

function MainSessionsDisplay(props) {
	return (
		<div>
			<div>
				<div id='available'>
						<h1>Available sessions</h1>
						<div className='session_wrapper'>
								<AllSessions sessionlist={props.sessions.availableSessions} />
						</div>
						<br />
				</div>
				<div id='booked'>
						<h1>Booked sessions</h1>
						<div className='session_wrapper'>
								<AllSessions sessionlist={props.sessions.bookedSessions} />
						</div>
						<br />
				</div>
				<div id='full'>
						<h1>Full sessions</h1>
						<div className='session_wrapper'>
								<AllSessions sessionlist={props.sessions.fullSessions} />
						</div>
				</div>
			</div>
		</div>
	)
}

export default MainSessionsDisplay
