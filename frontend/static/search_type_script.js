document.addEventListener('DOMContentLoaded', function() {
    var searchType = document.getElementById('searchType');
    var searchText = document.getElementById('searchText');

    searchType.addEventListener('change', function() {
      var selectedOption = searchType.value;
      searchText.textContent = 'Πληκτρολογήστε ' + selectedOption;
        if (selectedOption === 'title') {
            searchText.textContent  = 'Πληκτρολογήστε τον τίτλο του βιβλίου';
      } else if (selectedOption === 'author') {
        searchText.textContent  = 'Πληκτρολογήστε τον συγγραφέα';
      } else if (selectedOption === 'category') {
        searchText.textContent  = 'Πληκτρολογήστε την κατηγορία';
      } else if (selectedOption === 'keyword') {
        searchText.textContent  = 'Πληκτρολογήστε κάποια λέξη - κλειδί';
      } else if (selectedOption === 'ISBN') {
        searchText.textContent  = 'Πληκτρολογήστε το ISBN του βιβλίου';
//       }
    }});
  });
