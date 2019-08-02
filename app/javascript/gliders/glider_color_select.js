var updateEnabledState = function() {
  var colorRadios = document.getElementsByClassName('glider-color-radios');

  for (let colorRadio of colorRadios) {
    var enabledClass = colorRadio.getAttribute('data-enabled-class');

    enabledClassElements = document.getElementsByClassName(enabledClass);

    for (let element of enabledClassElements) {
      element.toggleAttribute('disabled', !colorRadio.checked);
    }
  }
}

var handleGliderColorRadios = function() {
  var colorRadios = document.getElementsByClassName('glider-color-radios');

  if (colorRadios.length == 0) {
    return;
  }

  for (let select of colorRadios) {
    select.addEventListener('change', updateEnabledState);
  }
}

document.addEventListener('turbolinks:load', function() {
  handleGliderColorRadios();
  updateEnabledState();
});
