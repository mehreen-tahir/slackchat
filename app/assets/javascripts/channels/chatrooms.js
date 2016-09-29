App.chatrooms = App.cable.subscriptions.create("ChatroomsChannel", {
  connected: function() {
  },

  disconnected: function() {
  },

  received: function(data) {
    $("[data-behaviour='messages']").append(data.message)
  }
});
