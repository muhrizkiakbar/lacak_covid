$('.modal-edit, .modal-new').on('hidden.bs.modal', function (e) {
    $(this).find('form').remove();
});

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

var enableDatepicker = function () {
    $('.datepicker').datepicker({
        format : 'yyyy/mm/dd',
        autoclose: true,
        todayHighlight: true
    });
};

enableDatepicker();

var enableSelect2 = function () {
    $('[data-toggle="select"]').select2();
};

enableSelect2();



var apiKecamatan = function() {
    $('#main_patient_main_city_id').on('select2:select', function (e) {
        // ajax: {
        //     url: '/main/search_on_select2_districts/'
        // }
        console.log(e.params.data.id);
        
    });
};

var apiKelurahan = function() {
    $('#main_patient_main_district_id').on('select2:select', function (e) {
        // ajax: {
        //     url: 'main/search_on_select2_sub_districts/'
        // }
        console.log(e.params.data.id);
        
    });
};

var apiRW = function() {
    $('#main_patient_main_sub_district_id').on('select2:select', function (e) {
        // ajax: {
        //     url: '/main/search_on_select2_citizen_associations/'
        // }
        console.log(e.params.data.id);
        
    });
};

var apiRT = function() {
    $('#main_patient_main_citizen_association_id').on('select2:select', function (e) {
        // ajax: {
        //     url: '/main/search_on_select2_neighborhood_associations/'
        // }
        console.log(e.params.data.id);
        
    });
};