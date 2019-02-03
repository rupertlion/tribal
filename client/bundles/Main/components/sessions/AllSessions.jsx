import React from "react";

const AllSessions = props => {

	let sessionType = props.sessionType
	let buttonName = props.buttonName

	let sessions = props.sessionlist.sessions.map(session => {
		if (session.status==sessionType){
			return (
				<div className="wrapper">
					<div id={session.id} className='session'>
						<h1 className="session_name">{session.title}</h1>
						<p>{new Date(session.start_date).toLocaleString('en-GB', { h12: false })}</p>
					</div>
					<div style={buttonName ? {} : { display: "none" }} >
						<button className="button">{buttonName}</button>
					</div>

				</div>
			);
		}
	});
	return (
	<div id={props.sessionType}>
		<h1>{props.sessionType} sessions</h1>
		<div className='session_wrapper'>
			<div>{sessions}</div>
		</div>
		<br />
	</div>)
};

export default AllSessions;
