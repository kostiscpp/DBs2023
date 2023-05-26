$(document).ready(function() {
    var dataTable = $('#bookTableSchoolAdmin').DataTable();

    $('#btnBookSearchAdmin').on('click', function() {
        var searchType = $('#btnBookSearchAdmin').val();
        var searchKey = $('#textBookSearchAdmin').val();

        $.ajax({
            url: '/admin/books',
            method: 'POST',
            data: { searchType: searchType, searchKey: searchKey },
            success: function(response) {
                dataTable.clear();

                response.forEach(function(book) {
                    dataTable.row.add([books.title, books.author, books.book_copies_number, books.available_copies_number]).draw();
                });
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
});

