 jQuery(document).ready(function() {
    var dataTable = $('#bookTableSchool').DataTable();

    jQuery('#btnBookSearch').on('click', function() {
        var searchType = $('#btnBookSearch').val();
        var searchKey = $('#textBookSearch').val();

        jQuery.ajax({
            url: '/admin/users',
            method: 'POST',
            data: { searchType: searchType, searchKey: searchKey },
            success: function(response) {
                dataTable.clear();

                response.forEach(function(user) {
                    // dataTable.row.add([books.title, books.name, books.nam]).draw();
                    dataTable.row.add([user.first_name, user.surname, user.email, user.role]).draw();
                });
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
});


