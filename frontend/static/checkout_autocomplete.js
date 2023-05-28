console.log("Loaded scripts.js");
$(document).ready(function() {
  // Book Autocomplete Button Click Event
  $('#bookAutocompleteBtn').click(function() {
    console.log("Button comple");
    var isbn = $('#isbnInput').val();
    // Make an asynchronous request to your server to fetch book info based on the ISBN
    // Update the book info fields with the returned data
    $.ajax({
      url: '/checkout/autocomplete/book',
      method: 'GET',
      data: { isbn: isbn },
      success: function(response) {
        var books = JSON.parse(response);
        $('#bookTitle').val(books[0].title);
        $('#bookAuthor').val(books[0].author);
        $('#bookPages').val(books[0].pages);
        $('#bookYear').val(books[0].year);
      },
      error: function(error) {
        console.log(error);
      }
    });
  });

  // User Autocomplete Button Click Event
  $('#userAutocompleteBtn').click(function() {
    var barcode = $('#barcodeInput').val();
    // Make an asynchronous request to your server to fetch user info based on the barcode
    // Update the user info fields with the returned data
    $.ajax({
      url: '/checkout/autocomplete/user',
      method: 'GET',
      data: { barcode: barcode },
      success: function(response) {
        var users = JSON.parse(response);
        $('#userFirstName').val(users[0].first_name);
        $('#userSurname').val(users[0].surname);
        $('#userRole').val(users[0].role);
        $('#userSchool').val(users[0].school_name);
        $('#userEmail').val(users[0].email);
      },
      error: function(error) {
        console.log(error);
      }
    });
  });
});
