import consumer from "./consumer"

consumer.subscriptions.create("ChatsChannel", {
  connected() {
    console.log("Connected to the comments channel!");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(typeof data.message);
    let html = JSON.parse(data.message)
    let message_html = `<div class="message">
      <strong>Me:</strong> says:
    <p>${html.content}</p>
    <small>${html.created_at}</small>
    <hr>
  </div>
  `
    document.getElementById("messages").innerHTML += message_html
    document.querySelector(".form-control").value ='';
    document.querySelector("#button").disabled = false;
    // Called when there's incoming data on the websocket for this channel
  }
});
