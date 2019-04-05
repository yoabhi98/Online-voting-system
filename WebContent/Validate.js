
function validateForm()
{
    
    var dob = document.getElementById("dateofbirth").value;
   
    var area = document.getElementById("areaofinterest").value;
    if (area == "")
    {
        alert("Please select an Area of Interest!");
        return false;
    }
    var now = new Date();
    var birthdate = dob.split("/");
    var born = new Date(dob[2], dob[0], dob[1] * 1 - 1);
    var age = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
    if (area == "adults" && age<18)
    {
        alert("You need to be 18 years of age and older for the Adults books!");
        return false;
    }
return true;
}
