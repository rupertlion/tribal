import React from "react";

const AllSessions = props => {

	let sessionlist = props.sessionlist;

	let sessions = sessionlist.map(session => {

		return (
			<div className="wrapper" key={session.id} >
				<div id={session.id} className='session'>
					<h1 className="session_name">{session.title}</h1>
					<p>{new Date(session.start_date).toLocaleString('en-GB', { h12: false })}</p>
				</div>
				<button className="button">join</button>
			</div>
		);
	});
	return <div>{sessions}</div>
};

export default AllSessions;
