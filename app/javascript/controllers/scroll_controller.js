import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  connect() {
    console.log("conected")
    const chatbox = document.getElementById("chatbox");
    console.log(chatbox)
    chatbox.addEventListener("DOMNodeInserted", this.resetScroll);
    this.resetScroll(chatbox);
  }

  resetScroll(){
    chatbox.scrollTop = chatbox.scrollHeight - chatbox.clientHeight;
  }
}
