// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var onStudentSelectChange = function(){
  var gliderSelect = document.getElementById('attendance_glider_id');
  var studentId = this.value;
  var availableGliderOptions = gliderSelect.querySelectorAll('option[data-student-id="' + studentId + '"], option[data-student-id=""]');
  
  gliderSelect.querySelectorAll('option').forEach(function(option) {
    option.style.display = 'none';
  });

  availableGliderOptions.forEach(function(option) {
    option.style.display = 'block';
  });

  gliderSelect.value = availableGliderOptions[0].value;
};


document.addEventListener('turbolinks:load', function() {
  onStudentSelectChange();

  document.getElementById('attendance_student_id').addEventListener('change', onStudentSelectChange);
});
