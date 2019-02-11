import React from "react";
import AllSessions from "./AllSessions";

function LandingPageSessionDisplay(props) {
	return (
		<div>
			<AllSessions sessionType="scheduled" sessionlist={props} />
			<AllSessions sessionType="confirmed" sessionlist={props} />
		</div>
	);
}

export default LandingPageSessionDisplay;