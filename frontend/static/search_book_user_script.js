// $(document).ready(function() {
//   $('#bookTableSchool').DataTable({
//   });
// });

$(document).ready(function() {
    
  // Destroy the existing DataTable instance, if it exists
  if ($.fn.DataTable.isDataTable('#bookTableSchool')) {
    $('#bookTableSchool').DataTable().destroy();
  }

  // Initialize DataTable on the table
  $('#bookTableSchool').DataTable({
    // Your DataTable configuration options
  });

});
