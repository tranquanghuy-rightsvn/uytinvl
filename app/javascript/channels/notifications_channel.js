import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#notifications-list").prepend(data.layout);
    let counter = parseInt($(".count-noti").text());
    if (counter >= 99){
      $(".count-noti").html("<p>" + 99 + "</p>"); 
    } else {
      $(".count-noti").html("<p>" + (counter + 1) + "</p>"); 
    }
  }
});
