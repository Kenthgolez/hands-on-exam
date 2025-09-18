function validateForm(){
    let mobile = document.getElementById("mobile").value.trim();
    let password = document.getElementById("password").value.trim();

    if (mobile === "" || password === ""){
        alert("both fields arre required");
        return false;
    }
    return true;
}