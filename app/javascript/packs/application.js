// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// External imports
import "bootstrap";

// scroll effect on card from second BG home
import { scrollBg2 } from '../components/scrollBg2';

// call to action video effect onload
import { videoBtn } from '../components/videoBtn';

// effect arrow(anchor) homepage arrow is bouncing
import { arrowBounce } from '../components/arrowBounce';

// effect navbar link stragger
import { navbarLink } from '../components/navbarLink';

// Internal imports, e.g:
import { initChatroomCable } from "../channels/chatroom_channel";

// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initChatroomCable();
  arrowBounce();
  scrollBg2();
  navbarLink();
  videoBtn();
});
