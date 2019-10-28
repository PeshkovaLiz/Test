
function Filter() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue, select;
  input = document.getElementById("myInput");
  filter = input.value.toLowerCase();
  table = document.getElementById("usersTable");
  tr = table.getElementsByTagName("tr");
  select=$("#filterselect").val();
   

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[select];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toLowerCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}


