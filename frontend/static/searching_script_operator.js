jQuery(document).ready(function() {
    var dataTable = $('#bookTableSchool').DataTable();

    jQuery('#btnBookSearch').on('click', function() {
        var searchType = $('#btnBookSearch').val();
        var searchKey = $('#textBookSearch').val();

        jQuery.ajax({
            url: '/operator/books',
            method: 'POST',
            data: { searchType: searchType, searchKey: searchKey },
            success: function(response) {
                dataTable.clear();

                response.forEach(function(book) {
                    // dataTable.row.add([books.title, books.name, books.nam]).draw();
                    dataTable.row.add([book.title, book.name, book.book_copies_number, book.available_copies_number]).draw();
                });
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
});


