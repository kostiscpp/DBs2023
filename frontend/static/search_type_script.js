// $(document).ready(function() {
//     $('#search-type').change(function() {
//       var selectedOption = $(this).val();
//       var descriptionText = '';
  
//       if (selectedOption === 'title') {
//         descriptionText = 'Type book title';
//       } else if (selectedOption === 'author') {
//         descriptionText = 'Type author name';
//       } else if (selectedOption === 'category') {
//         descriptionText = 'Type category';
//       } else if (selectedOption === 'keyword') {
//         descriptionText = 'Type keyword';
//       }
//       else if (selectedOption === 'ISBN') {
//         descriptionText = 'Type ISBN';
//       }
  
//       $('#search-text').text(descriptionText);
//     });
//   });

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

// document.addEventListener('DOMContentLoaded', function() {
//   var searchType = document.getElementById('searchType');
//   var searchText = document.getElementById('searchText');

//   searchType.addEventListener('change', function() {
//       var selectedOption = searchType.value;
//       if (selectedOption === 'title') {
//           searchText.placeholder = 'Πληκτρολογήστε τον τίτλο του βιβλίου';
//       } else if (selectedOption === 'author') {
//           searchText.placeholder = 'Πληκτρολογήστε τον συγγραφέα';
//       } else if (selectedOption === 'category') {
//           searchText.placeholder = 'Πληκτρολογήστε την κατηγορία';
//       } else if (selectedOption === 'keyword') {
//           searchText.placeholder = 'Πληκτρολογήστε κάποια λέξη - κλειδί';
//       } else if (selectedOption === 'ISBN') {
//           searchText.placeholder = 'Πληκτρολογήστε το ISBN του βιβλίου';
//       }
//   });
// });
