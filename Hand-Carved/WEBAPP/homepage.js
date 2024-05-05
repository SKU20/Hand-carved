function toggleDropdown() {
  var dropdownList = document.getElementById("dropdownList");
  dropdownList.classList.toggle("show");
}

window.addEventListener("click", function (e) {
  var dropdownBtn = document.querySelector(".profile-dropdown-btn");
  var dropdownList = document.getElementById("dropdownList");
  
  if (!dropdownBtn.contains(e.target)) {
    dropdownList.classList.remove("show");
  }
});
var name = "${sessionScope.name}";

        // Use the "history.pushState()" method to change the browser's history
        if (!name) {
            var url = window.location.href;
            var index = url.indexOf("/homepage.jsp");
            if (index !== -1) {
                // Replace "/homepage.jsp" with "/index.jsp" in the URL
                var newUrl = url.substring(0, index) + "/index.jsp";
                history.pushState(null, null, newUrl);
            }
        }