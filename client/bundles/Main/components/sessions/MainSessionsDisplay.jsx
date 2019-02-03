import React from 'react';
import AllSessions from "./AllSessions";

function MainSessionsDisplay(props) {
	return (
		<div>
			<AllSessions sessionType="available" sessionlist={props.sessions.availableSessions} />
			<AllSessions sessionType="booked" sessionlist={props.sessions.bookedSessions} />
			<AllSessions sessionType="full" sessionlist={props.sessions.fullSessions} />
		</div>
	)
}

export default MainSessionsDisplay
