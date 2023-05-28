$(document).ready(function() {
  // Book Autocomplete Button Click Event
  $('#bookAutocompleteBtn').click(function() {
    var isbn = $('#isbnInput').val();
    // Make an asynchronous request to your server to fetch book info based on the ISBN
    // Update the book info fields with the returned data
    $.ajax({
      url: '/checkout/autocomplete/book',
      method: 'GET',
      data: { isbn: isbn },
      success: function(book) {
        $('#bookTitle').val(book.title);
        $('#bookAuthor').val(book.author);
        $('#bookPages').val(book.pages);
        $('#bookYear').val(book.year);
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
      success: function(user) {
        $('#userFirstName').val(user.first_name);
        $('#userSurname').val(user.surname);
        $('#userRole').val(user.role);
        $('#userSchool').val(user.school_name);
        $('#userEmail').val(user.email);
      },
      error: function(error) {
        console.log(error);
      }
    });
  });
});