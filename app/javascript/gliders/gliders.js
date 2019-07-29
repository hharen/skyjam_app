
var onStudentSelectChange = function(){
  var gliderSelect = document.getElementById('attendance_glider_id');
  var studentSelect = document.getElementById('attendance_student_id')

  var studentId = studentSelect.value;
  var availableGliderOptions = gliderSelect.querySelectorAll('option[data-student-id="' + studentId + '"], option[data-student-id=""]');

  gliderSelect.querySelectorAll('option').forEach(function(option) {
    option.style.display = 'none';
  });

  availableGliderOptions.forEach(function(option) {
    option.style.display = 'block';
  });

  gliderSelect.value = availableGliderOptions[0].value;
};

var handleStudentSelect = function() {
  var gliderSelect = document.getElementById('attendance_glider_id');

  if (gliderSelect == null) {
    return;
  }

  onStudentSelectChange();
  document.getElementById('attendance_student_id').addEventListener('change', onStudentSelectChange);
}

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
  handleStudentSelect();
  handleGliderColors();
});

