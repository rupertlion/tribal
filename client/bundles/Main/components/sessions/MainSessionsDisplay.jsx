import React from 'react';
import AllSessions from "./AllSessions";

function MainSessionsDisplay(props) {
	return (
		<div>
			<AllSessions sessionType="available" buttonName="Book" sessionlist={props.sessions} />
			<AllSessions sessionType="booked" buttonName="Join" sessionlist={props.sessions} />
			<AllSessions sessionType="full"  sessionlist={props.sessions} />
		</div>
	)
}

export default MainSessionsDisplay
