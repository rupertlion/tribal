import React from 'react';
import AllSessions from "./AllSessions";

function MainSessionsDisplay(props) {
	return (
		<div>
			<AllSessions sessionType="available" sessionlist={props.sessions} />
			<AllSessions sessionType="booked" sessionlist={props.sessions} />
			<AllSessions sessionType="full" sessionlist={props.sessions} />
		</div>
	)
}

export default MainSessionsDisplay
