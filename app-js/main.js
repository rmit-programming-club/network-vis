import { drawGraph } from './d3/network.js';

console.log('hello from the compiled JS');

// Add listener to button
$(document).on('turbolinks:load', function() {
  $('#submit-name').click(drawGraph)
});
