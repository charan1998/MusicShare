document.addEventListener("DOMContentLoaded", function(event) {
  document.getElementById('logButton').disabled = true;
});

function check() {
  var email = document.getElementById('email').value;
  var pass = document.getElementById('pass').value;
  if (email != '' && pass != '') {
    document.getElementById('logButton').disabled = false;
  }
  else {
    document.getElementById('logButton').disabled = true;
  }
}
