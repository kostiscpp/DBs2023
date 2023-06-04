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
                    dataTable.row.add([user.full_name, user.username, user.email, user.role]).draw();
                });
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
});