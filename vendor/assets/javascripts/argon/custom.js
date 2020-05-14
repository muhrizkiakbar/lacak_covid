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
        format : 'yyyy-mm-dd',
        autoclose: true,
        todayHighlight: true
    });
};

var enableSelect2 = function () {
    $('[data-toggle="select"]').select2();
};

var listKecamatan, listKelurahan, listRW, listRT = null;
var apiKecamatan = function() {
    $('#main_patient_main_district_id').empty().trigger('change');
    $('#main_patient_main_sub_district_id').empty().trigger('change');
    $('#main_patient_main_citizen_association_id').empty().trigger('change');
    $('#main_patient_main_neighborhood_association_id').empty().trigger('change');
    $('#main_patient_main_city_id').on('select2:select', function (e) {
        $.ajax({
            url: '/main/search_on_select2_districts/'+e.params.data.id,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                listKecamatan = null;
                listKecamatan = $.map(data, function (obj) {
                    obj.id = obj.id || obj.slug;
                    obj.text = obj.text || obj.district;
                    return obj;
                });
                $('#main_patient_main_district_id').select2({
                    data: listKecamatan
                });
                $('#main_patient_main_district_id').val(null).trigger('change');
            }
        });
        
    });
};

var apiKelurahan = function() {
    $('#main_patient_main_sub_district_id').empty().trigger('change');
    $('#main_patient_main_citizen_association_id').empty().trigger('change');
    $('#main_patient_main_neighborhood_association_id').empty().trigger('change');
    $('#main_patient_main_district_id').on('select2:select', function (e) {
        $.ajax({
            url: '/main/search_on_select2_sub_districts/'+e.params.data.id,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                listKelurahan = null;
                listKelurahan = $.map(data, function (obj) {
                    obj.id = obj.id || obj.slug;
                    obj.text = obj.text || obj.sub_district;
                    return obj;
                });
                $('#main_patient_main_sub_district_id').select2({
                    data: listKelurahan
                });
                $('#main_patient_main_sub_district_id').val(null).trigger('change');
            }
        });
    });
};


var apiRW = function() {
    $('#main_patient_main_citizen_association_id').empty().trigger('change');
    $('#main_patient_main_neighborhood_association_id').empty().trigger('change');
    $('#main_patient_main_sub_district_id').on('select2:select', function (e) {
        $.ajax({
            url: '/main/search_on_select2_citizen_associations/'+e.params.data.id,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                listRW = null;
                listRW = $.map(data, function (obj) {
                    obj.id = obj.id || obj.slug;
                    obj.text = obj.text || obj.citizen_association;
                    return obj;
                });
                $('#main_patient_main_citizen_association_id').select2({
                    data: listRW
                });
                $('#main_patient_main_citizen_association_id').val(null).trigger('change');
            }
        });
    });
};

var apiRT = function() {
    $('#main_patient_main_neighborhood_association_id').empty().trigger('change');
    $('#main_patient_main_citizen_association_id').on('select2:select', function (e) {
        $.ajax({
            url: '/main/search_on_select2_neighborhood_associations/'+e.params.data.id,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                listRT = null;
                listRT = $.map(data, function (obj) {
                    obj.id = obj.id || obj.slug;
                    obj.text = obj.text || obj.neighborhood_association;
                    return obj;
                });
                $('#main_patient_main_neighborhood_association_id').select2({
                    data: listRT
                });
                $('#main_patient_main_neighborhood_association_id').val(null).trigger('change');
            }
        });
    });
};

(function($) {

    function mediaSize() {
        if (window.matchMedia("(max-width: 575.98px)").matches){
            $('.nav-form-circle').css("display", "flex");
            $('.nav-form-box').css("display", "none");
        } else {
            $('.nav-form-circle').css("display", "none");
            $('.nav-form-box').css("display", "flex");
        }
    }

    mediaSize();
    window.addEventListener("resize", mediaSize, false);
})(jQuery);