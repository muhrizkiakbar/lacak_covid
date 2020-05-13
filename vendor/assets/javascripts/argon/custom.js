$('.modal-edit').on('hidden.bs.modal', function (e) {
    $(this).find('form').remove();
})

$('div.notifikasi').show(function(){
    notifMessage = $(this).data('notifikasi');
    $.notify({
        icon: "ni ni-bell-55",
        title: notifMessage,
        message: "",
        url: ""
    }, {
        element: "body",
        type: "success",
        allow_dismiss: true,
        placement: {
            from: "top",
            align: "center"
        },
        offset: {
            x: 15,
            y: 15
        },
        spacing: 10,
        z_index: 1080,
        delay: 3000,
        timer: 1000,
        url_target: "_blank",
        mouse_over: !1,
        animate: {
            enter: "animated fadeInDown",
            exit: "animated fadeOutUp"
        },
        template: '<div data-notify="container" class="alert alert-dismissible alert-{0} alert-notify" role="alert"><span class="alert-icon" data-notify="icon"></span> <div class="alert-text"</div> <span class="alert-title" data-notify="title">{1}</span> <span data-notify="message">{2}</span></div><button type="button" class="close" data-notify="dismiss" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>'
    });
    $(this).hide();
});