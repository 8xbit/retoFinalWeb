    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent form submission

        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;

        // Fetch XML data containing user information
        fetch('users.xml')
            .then(response => response.text())
            .then(xmlString => {
                var parser = new DOMParser();
                var xmlDoc = parser.parseFromString(xmlString, "text/xml");

                var users = xmlDoc.getElementsByTagName('user');
                var isValid = false;

                for (var i = 0; i < users.length; i++) {
                    var name = users[i].getElementsByTagName('name')[0].childNodes[0].nodeValue;
                    var pwd = users[i].getElementsByTagName('password')[0].childNodes[0].nodeValue;

                    if (name === username && pwd === password) {
                        isValid = true;
                        break;
                    }
                }

                if (isValid) {
                    // Redirect to another page
                    window.location.href = '../dashboard.html';
                } else {
                    // Show error message
                    document.getElementById('error').innerText = 'Invalid username or password';
                    document.getElementById('error').style.display = 'block';
                }
            })
            .catch(error => {
                console.error('Error fetching XML data:', error);
            });
    });


    window.onload = function() {
        alert("Operation completed successfully");
        window.location.href = "./Transformations/dashboard.php"; // Replace with your target page
    };