//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// videocall

const handleFail = () => {
	console.log("Error: ", err);
}

let remoteContainer = document.getElementById("#remote-container");
let canvasContainer = document.getElementById("#canvas-container");

const addVideoStream = (streamId) => {
	let streamDiv = document.createElement("div");
	streamDiv.id = streamId;
	streamDiv.style.transform = "rotateY(180deg)";
	remoteContainer.appendChild(streamDiv);
}

const removeVideoStream = () => {
	let stream = evt.stream;
	stream.stop();
	let remDiv = document.getElementById(stream.getId());
	remDiv.parentNode.removeChild(remDiv);
	console.log("Remote stream is removed" + stream.getId());
}

const addCanvas = (streamId) => {
	let video = document.getElementById(`video${streamId}`);
	let canvas = document.createElement("canvas");
	canvasContainer.appendChild(canvas);
	let ctx = canvas.getContext("2d");

	video.addEventListener("loadedmetadata", event => {
		canvas.width = video.videoWidth;
		canvas.height = video.videoHeight;
	});

	video.addEventListener('play', event => {
		let $this = this;
		const loop = () => {
			if (!$this.paused && !$this.ended) {
				if ($this.width !== canvas.width) {
					canvas.width = video.videoWidth;
					canvas.height = video.videoHeight;
				}
				ctx.drawImage($this, 0, 0);
				setTimeout(loop, 1000 / 30);
			}
		}
	});
}

let client = AgoraRTC.createClient({
	mode: 'live',
	codec:'h264'
});

client.init('9fe6d9bebd0c49e48096c8d67c584ac2', () => {
	consol.log('Client initialized!')
});

client.join(null, 'Tribal', (uid) => {
	let localStream = AgoraRTC.createStream({
		streamID: uid,
		audio: false,
		video: true,
		screen: false
	});

	localStream.init( () => {
		localStream.play('me');
		client.publish(localStream.handleFail);

		client.on('stream-added', (evt) => {
			client.subscribe(evt.stream.handleFail);
		});

		client.on('stream-subscribed', (evt) => {
			let stream = evt.stream;
			addVideoStream(stream.getID());
			stream.play(stream.getID());
			addCanvas(stream.getID());
		});

		client.on('stream-removed', removeVideoStream);
	}, handleFail)
}, handleFail); 

// stripe

const stripeTokenHandler = (token) => {
	let stripeForm = document.getElementById('transaction_form');
	const hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type', 'hidden');
	hiddenInput.setAttribute('name', 'stripeToken');
	hiddenInput.setAttribute('value', token.id);
	stripeForm.appendChild(hiddenInput);

	stripeForm.submit();
};

const initiateStripe = () => {
	const stripe = Stripe('pk_test_QicERB8w3kyqaYW3hUUQylRH');

	const elements = stripe.elements();

	const card = elements.create('card', { hidePostalCode: true });

	card.mount('#card-element');

	const form = document.getElementById('transaction_form');
	form.addEventListener('submit', () => {
		event.preventDefault();
		stripe.createToken(card).then(result => {
			stripeTokenHandler(result.token);
		})
	})
};

document.addEventListener('turbolinks:load', () => {
	let stripeForm = document.getElementById('transaction_form');

	if (stripeForm) {
		initiateStripe();
	}
});
