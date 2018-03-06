import { drawGraph } from './d3/network.js';

console.log('hello from the compiled JS');

// Add listener to button
$(document).on('turbolinks:load', function() {
  if ($('#cal-heatmap').length > 0) { // on home page
    drawGraph('rmit-programming-club');
  }

  $('#submit-name').click(() => {
    let name = $('#name')[0].value
    drawGraph(name);
  });
});
