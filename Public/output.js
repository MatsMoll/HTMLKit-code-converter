
function generate() {

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "", true);
    xhr.setRequestHeader("Content-Type", "text/html");
    xhr.onreadystatechange = function () {
        if (this.readyState != 4) return;

        if (this.status == 200) {
            document.getElementById("generated").innerHTML = this.responseText;
        }
    };

    let html = document.getElementById("html").value;
    xhr.send(html);
}
