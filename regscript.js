document.addEventListener("DOMContentLoaded", function(event) {
  document.getElementById('regButton').disabled = true;
});

function check() {
  var first = document.getElementById('first').value;
  var last = document.getElementById('last').value;
  var email = document.getElementById('email').value;
  var pass = document.getElementById('pass').value;
  var rpass = document.getElementById('rpass').value;
  if (first != '' && last != '' && email != '' && pass != '' && rpass != '' && pass == rpass) {
    document.getElementById('regButton').disabled = false;
    document.getElementById('passErr').innerHTML = "";
  }
  else {
    if (pass != rpass) {
      document.getElementById('passErr').innerHTML = "*Passwords don't match";
    }
    document.getElementById('regButton').disabled = true;
  }
}
