import React from 'react';
import AllSessions from "./AllSessions";

function MainSessionsDisplay(props) {
	return (
		<div>
			<AllSessions sessionType="scheduled" buttonName="Book" sessionlist={props} />
			<AllSessions sessionType="confirmed" buttonName="Join" sessionlist={props} />
			<AllSessions sessionType="full"  sessionlist={props} />
		</div>
	)
}

export default MainSessionsDisplay
