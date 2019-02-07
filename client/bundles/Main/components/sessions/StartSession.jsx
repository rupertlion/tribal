import React from 'react';

function StartSession(props) {

	return (
		<div>
			<div class="videocall">
                <h1 class="text-white">
                    Session Video Call
                </h1>

                <h4 class="text-white">My feed</h4>

                <div id="me">

                </div>

                <h4 class="text-white">Remote feeds</h4>

                <div id="remote-container">

                </div>

                <h4 class="text-white">Canvas feeds</h4>

                <div id="canvas-container">

                </div>
            </div>
		</div>
	);
}

export default StartSession;
