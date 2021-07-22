  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });

  
  $(function () {
      var url = window.location.pathname;
      var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");  
      $('a').each(function () {
    	  if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
              $(this).addClass('active');
          }
      });
  });
  
  $(function() {
      var url = window.location.pathname;
      var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");  
      $('a').each(function() {
    	  if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
              $(this).closest('ul').parent().children('a').addClass('active');
              $(this).closest('ul').parent().addClass('menu-is-opening menu-open')
          }
      });
  });
  
  $('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
  