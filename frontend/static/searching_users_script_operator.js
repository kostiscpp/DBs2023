 jQuery(document).ready(function() {
    var dataTable = $('#bookTableSchool').DataTable();

    jQuery('#btnBookSearch').on('click', function() {
        var searchType = $('#btnBookSearch').val();
        var searchKey = $('#textBookSearch').val();

        jQuery.ajax({
            url: '/operator/users',
            method: 'POST',
            data: { searchType: searchType, searchKey: searchKey },
            success: function(response) {
                dataTable.clear();

                response.forEach(function(user) {
                    dataTable.row.add([user.first_name, user.surname, user.email, user.role]).draw();
                });
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
});


