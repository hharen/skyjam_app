var updateVisibleState = function() {
  var colorRadios = document.getElementsByClassName('glider-color-radios');

  for (let colorRadio of colorRadios) {
    var visibleClass = colorRadio.getAttribute('data-visible-class');

    visibleClassElements = document.getElementsByClassName(visibleClass);

    for (let element of visibleClassElements) {
      element.style.display = colorRadio.checked ? '' : 'none';
    }
  }
}


var handleGliderColorRadios = function() {
  var colorRadios = document.getElementsByClassName('glider-color-radios');

  if (colorRadios.length == 0) {
    return;
  }

  for (let select of colorRadios) {
    select.addEventListener('change', updateVisibleState);
  }
}

document.addEventListener('turbolinks:load', function() {
  handleGliderColorRadios();
  updateVisibleState();
});
