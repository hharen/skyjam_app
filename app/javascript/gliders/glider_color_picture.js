var onGliderColorChange = function() {
  var area = this.getAttribute('data-area')
  var pathElements = document.getElementsByClassName(area);

  for (let pathElement of pathElements) {
    var color = this.value;

    if (color == '') {
      color = 'none'
    }

    pathElement.style.fill = color;
  }
}

var handleGliderColors = function() {
  var colorSelects = document.getElementsByClassName('glider-color-select');

  if (colorSelects.length == 0) {
    return;
  }

  for (let select of colorSelects) {
    select.addEventListener('change', onGliderColorChange);
  }
}

document.addEventListener('turbolinks:load', function() {
  handleGliderColors();
});

