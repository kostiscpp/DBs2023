// /*!
//     * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
//     * Copyright 2013-2023 Start Bootstrap
//     * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
//     */
//     //
// // Scripts
// //
//
// window.addEventListener('DOMContentLoaded', event => {
//
//     // Toggle the side navigation
//     const sidebarToggle = document.body.querySelector('#sidebarToggle');
//     if (sidebarToggle) {
//         // Uncomment Below to persist sidebar toggle between refreshes
//         // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
//         //     document.body.classList.toggle('sb-sidenav-toggled');
//         // }
//         sidebarToggle.addEventListener('click', event => {
//             event.preventDefault();
//             document.body.classList.toggle('sb-sidenav-toggled');
//             localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
//         });
//     }
//
// });
//
// // document.getElementById('btnNavbarSearch').addEventListener('click', function() {
// //     window.location.href = '/admin/books'; // Replace with the desired URL
// // });
//
// jQuery(document).ready(function() {
//     var dataTable = jQuery('#bookTableSchoolAdmin').DataTable();
//
//     jQuery('#btnBookSearchAdmin').on('click', function() {
//         var searchType = jQuery('#btnBookSearchAdmin').val();
//         var searchKey = jQuery('#textBookSearchAdmin').val();
//
//         jQuery.ajax({
//             url: '/admin/books',
//             method: 'POST',
//             data: { searchType: searchType, searchKey: searchKey },
//             success: function(response) {
//                 dataTable.clear();
//
//                 response.forEach(function(book) {
//                     dataTable.row.add([book.title, book.name, book.book_copies_number, book.available_copies_number]).draw();
//                 });
//             },
//             error: function(error) {
//                 console.log(error);
//             }
//         });
//     });
// });
window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});
