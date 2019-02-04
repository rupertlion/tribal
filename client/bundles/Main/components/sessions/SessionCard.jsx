import React from 'react'

export default function SessionCard(props) {
	return (
		<div>
			<div id={props.session.id} className="wrapper">
						<div className='session'>
							<h1 className="session_name">{props.session.title}</h1>
							<p>{new Date(props.session.start_date).toLocaleString('en-GB', { h12: false })}</p>
						</div>
						{/* <div style={props.buttonName ? {} : { display: "none" }} >
							<button onClick={this.toggleShowDetails} className="button">{this.state.buttonName}</button>
						</div>
						<div style={props.showDetails ? {} : { display: "none" }}>
							<button
								className="button m-4"
								onClick={this.buyStripe}
							>
								Buy session
							</button>
						</div> */}
					</div>
		</div>
	)
}
