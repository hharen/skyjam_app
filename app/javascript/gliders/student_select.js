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

document.addEventListener('turbolinks:load', function() {
  handleStudentSelect();
});
