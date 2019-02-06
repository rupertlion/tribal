//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// videocall

let remoteContainer;
let canvasContainer;

let handleFail = function (err) {
	console.log("Error : ", err);
};

function addVideoStream(streamId) {
	let streamDiv = document.createElement("div");
	streamDiv.id = streamId;
	streamDiv.style.transform = "rotateY(180deg)";
	remoteContainer.appendChild(streamDiv);
}

function removeVideoStream(evt) {
	let stream = evt.stream;
	stream.stop();
	let remDiv = document.getElementById(stream.getId());
	remDiv.parentNode.removeChild(remDiv);
	console.log("Remote stream is removed " + stream.getId());
}

function addCanvas(streamId) {
	let canvas = document.createElement("canvas");
	canvas.id = 'canvas' + streamId;
	canvasContainer.appendChild(canvas);
	let ctx = canvas.getContext('2d');
	let video = document.getElementById(`video${streamId}`);

	video.addEventListener('loadedmetadata', function () {
		canvas.width = video.videoWidth;
		canvas.height = video.videoHeight;
	});

	video.addEventListener('play', function () {
		var $this = this;
		(function loop() {
			if (!$this.paused && !$this.ended) {
				ctx.drawImage($this, 0, 0);
				setTimeout(loop, 1000 / 30);
			}
		})();
	}, 0);
}

let client = AgoraRTC.createClient({
	mode: 'live',
	codec: "h264"
});

client.init("5b4594eea0de44a39e6a3ce3605d27b8", () => console.log("AgoraRTC client initialized"), handleFail);

client.join(null, "any-channel", null, (uid) => {

	let localStream = AgoraRTC.createStream({
		streamID: uid,
		audio: false,
		video: true,
		screen: false
	});

	localStream.init(function () {
		
		localStream.play('me');
		client.publish(localStream, handleFail);
	
	}, handleFail);
}, handleFail);

client.on('stream-added', function (evt) {
	client.subscribe(evt.stream, handleFail);
});

client.on('stream-subscribed', function (evt) {
	let stream = evt.stream;
	addVideoStream(stream.getId());
	stream.play(stream.getId());
	addCanvas(stream.getId());
});

client.on('stream-removed', removeVideoStream);
client.on('peer-leave', removeVideoStream);


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
	const stripe = Stripe('pk_test_fkX4fHRDfkBHmGV6DUqT9ahX');

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
	remoteContainer = document.getElementById("remote-container");
    canvasContainer = document.getElementById("canvas-container");
	let stripeForm = document.getElementById('transaction_form');

	if (stripeForm) {
		initiateStripe();
	}
});
