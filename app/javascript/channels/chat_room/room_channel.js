import consumer from "../consumer"

document.addEventListener('readystatechange', function() {
  if (document.readyState === "complete") {
  const messages = document.getElementById('messages');
  messages.scrollTop = messages.scrollHeight;
  const author = document.getElementById('author');
  const chatSubmitButton = document.getElementById('chat-submit');

  const chatter = consumer.subscriptions.create("ChatRoom::RoomChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
      messages.scrollTop = messages.scrollHeight;
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      appendMessage(data);
    },

    speak: function(data) {
      return this.perform('speak', data);
    }
});

function appendMessage(data){
  const lilDiv = document.createElement('div');
  const styledAuthor = document.createElement('span');
  const author = document.createTextNode(`${data.author}:`);
  styledAuthor.style.fontWeight = "bold";
  styledAuthor.appendChild(author);

  lilDiv.appendChild(styledAuthor);
  lilDiv.appendChild(
    document.createTextNode(`\u00A0${data.content}`)
  );
  lilDiv.style = "display: inline-flex";

  messages.appendChild(
    lilDiv
  );

  messages.scrollTop = messages.scrollHeight;
}

// event listeners
chatSubmitButton.addEventListener('click', function(event) {
  event.preventDefault();
  chatter.speak({
    "content": message.value,
    "author": author.value
  });
  message.value = '';
  author.value = '';
});

}});
