import React from 'react';
import AllSessions from "./AllSessions";

function MainSessionsDisplay(props) {
	return (
		<div>
			<AllSessions sessionType="available" buttonName="Book" sessionlist={props} />
			<AllSessions sessionType="booked" buttonName="Join" sessionlist={props} />
			<AllSessions sessionType="full"  sessionlist={props} />
		</div>
	)
}

export default MainSessionsDisplay
