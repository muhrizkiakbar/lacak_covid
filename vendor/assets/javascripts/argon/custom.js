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
        todayHighlight: true,
        disableTouchKeyboard: true,
    });
};

var enableSelect2 = function () {
    $('[data-toggle="select"]').select2();
};

var listKecamatan, listKelurahan, listRW, listRT = null;
var apiKecamatan = function() {
    $('.kecamatan').empty().trigger('change');
    $('.kelurahan').empty().trigger('change');
    $('.erwe').empty().trigger('change');
    $('.erte').empty().trigger('change');
    $('.kabupaten_kota').on('select2:select', function (e) {
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
                $('.kecamatan').select2({
                    data: listKecamatan
                });
                $('.kecamatan').val(null).trigger('change');
            }
        });
        
    });
};

var apiKelurahan = function() {
    $('.kelurahan').empty().trigger('change');
    $('.erwe').empty().trigger('change');
    $('.erte').empty().trigger('change');
    $('.kecamatan').on('select2:select', function (e) {
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
                $('.kelurahan').select2({
                    data: listKelurahan
                });
                $('.kelurahan').val(null).trigger('change');
            }
        });
    });
};


var apiRW = function() {
    $('.erwe').empty().trigger('change');
    $('.erte').empty().trigger('change');
    $('.kelurahan').on('select2:select', function (e) {
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
                $('.erwe').select2({
                    data: listRW
                });
                $('.erwe').val(null).trigger('change');
            }
        });
    });
};

var apiRT = function() {
    $('.erte').empty().trigger('change');
    $('.erwe').on('select2:select', function (e) {
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
                $('.erte').select2({
                    data: listRT
                });
                $('.erte').val(null).trigger('change');
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

function clearIsInvalid () {
    $('input').on('focus', function() {
        $(this).closest('.form-group').removeClass('has-danger');
        $(this).removeClass('is-invalid');
    });
}
clearIsInvalid();

// Form 11-4
// (function(){
//     $('#lampiran_eleven_information_expose_main_type_contact_id').on('select2:select, change', function(){
//         if ($(this).val() == '') {
//             $('#lampiran_eleven_information_expose_other_type_contact').prop("disabled", false);
//         } else {
//             $('#lampiran_eleven_information_expose_other_type_contact').prop("disabled", true);
//         }
//     });

//     $('#lampiran_eleven_information_expose_main_type_contact_id').on('select2:opening', function() {
//         $(this).val(null).trigger('change');
//     });

//     $('#lampiran_eleven_information_expose_other_type_contact').on('keyup', function () {
//         if ($(this).val() == '') {
//             $('#lampiran_eleven_information_expose_main_type_contact_id').prop("disabled", false);
//         } else {
//             $('#lampiran_eleven_information_expose_main_type_contact_id').prop("disabled", true);
//         }
//     });
// }());

// (function(){
//     $('#lampiran_eleven_information_expose_main_set_location_id').on('select2:select, change', function(){
//         if ($(this).val() == '') {
//             $('#lampiran_eleven_information_expose_other_set_location').prop("disabled", false);
//         } else {
//             $('#lampiran_eleven_information_expose_other_set_location').prop("disabled", true);
//         }
//     });

//     $('#lampiran_eleven_information_expose_main_set_location_id').on('select2:opening', function() {
//         $(this).val(null).trigger('change');
//     });

//     $('#lampiran_eleven_information_expose_other_set_location').on('keyup', function () {
//         if ($(this).val() == '') {
//             $('#lampiran_eleven_information_expose_main_set_location_id').prop("disabled", false);
//         } else {
//             $('#lampiran_eleven_information_expose_main_set_location_id').prop("disabled", true);
//         }
//     });
// }());

// Form 11-4.1
// (function(){
//     $('#lampiran_eleven_close_contact_main_job_type_id').on('select2:select, change', function(){
//         if ($(this).val() == '') {
//             $('#lampiran_eleven_close_contact_other_job_type').prop("disabled", false);
//         } else {
//             $('#lampiran_eleven_close_contact_other_job_type').prop("disabled", true);
//         }
//     });

//     $('#lampiran_eleven_close_contact_main_job_type_id').on('select2:opening', function() {
//         $(this).val(null).trigger('change');
//     });

//     $('#lampiran_eleven_close_contact_other_job_type').on('keyup', function () {
//         if ($(this).val() == '') {
//             $('#lampiran_eleven_close_contact_main_job_type_id').prop("disabled", false);
//         } else {
//             $('#lampiran_eleven_close_contact_main_job_type_id').prop("disabled", true);
//         }
//     });
// }());

// (function(){
//     $('#lampiran_eleven_close_contact_main_transportation_id').on('select2:select, change', function(){
//         if ($(this).val() == '') {
//             $('#lampiran_eleven_close_contact_other_transportation').prop("disabled", false);
//         } else {
//             $('#lampiran_eleven_close_contact_other_transportation').prop("disabled", true);
//         }
//     });

//     $('#lampiran_eleven_close_contact_main_transportation_id').on('select2:opening', function() {
//         $(this).val(null).trigger('change');
//     });

//     $('#lampiran_eleven_close_contact_other_transportation').on('keyup', function () {
//         if ($(this).val() == '') {
//             $('#lampiran_eleven_close_contact_main_transportation_id').prop("disabled", false);
//         } else {
//             $('#lampiran_eleven_close_contact_main_transportation_id').prop("disabled", true);
//         }
//     });
// }());

// Form 11-6
(function(){
    var isPregnant;
    var pregnantChild = $('.pregnant-child');
    ($('#lampiran_eleven_comorbid_condition_is_pregnant').prop("checked") == true) ? pregnantChild.prop('disabled', false) :  pregnantChild.prop('disabled', true);
    $('#lampiran_eleven_comorbid_condition_is_pregnant').on('click', function () {
        isPregnant = $(this).prop("checked");
        (isPregnant == true) ? pregnantChild.prop('disabled', false) :  pregnantChild.prop('disabled', true);
    });

    var isFluVaccine;
    var fluChild = $('.flu-child');
    ($('#lampiran_eleven_comorbid_condition_is_influenza_vaccine').prop("checked") == true) ? fluChild.prop('disabled', false) :  fluChild.prop('disabled', true);
    $('#lampiran_eleven_comorbid_condition_is_influenza_vaccine').on('click', function () {
        isFluVaksin = $(this).prop("checked");
        (isFluVaksin == true) ? fluChild.prop('disabled', false) :  fluChild.prop('disabled', true);
    });

    var isPvcVaccine;
    var pvcChild = $('.pvc-child');
    ($('#lampiran_eleven_comorbid_condition_is_pvc_vaccine').prop("checked") == true) ? pvcChild.prop('disabled', false) :  pvcChild.prop('disabled', true);
    $('#lampiran_eleven_comorbid_condition_is_pvc_vaccine').on('click', function () {
        isPvcVaccine = $(this).prop("checked");
        (isPvcVaccine == true) ? pvcChild.prop('disabled', false) :  pvcChild.prop('disabled', true);
    });   
}());

// Form 11-7
(function(){
    var labelSembuh = $("label[for='lampiran_eleven_contact_status_date_of_status_recovered']");
    var labelMeninggal = $("label[for='lampiran_eleven_contact_status_date_of_status_died']");
    var inputSembuh = $("#lampiran_eleven_contact_status_date_of_status_recovered");
    var inputMeninggal = $("#lampiran_eleven_contact_status_date_of_status_died");
    var inputStatusPasien = $("#lampiran_eleven_contact_status_status_patient");
    function sembuhHide () {
        labelSembuh.hide();
        inputSembuh.hide();
    }
    function meninggalHide () {
        labelMeninggal.hide();
        inputMeninggal.hide();
    }
    function sembuhShow () {
        labelSembuh.show();
        inputSembuh.show();
    }
    function meninggalShow () {
        labelMeninggal.show();
        inputMeninggal.show();
    }
    function initOnLoad() {
        sembuhHide();
        meninggalHide();
        if (inputStatusPasien.val() == "sembuh" ) {
            sembuhShow();
        }else if (inputStatusPasien.val() == "meninggal" ){
            meninggalShow();
        }else{
            inputSembuh.val('');
            inputMeninggal.val('');
            sembuhHide();
            meninggalHide();
        }
    }
    initOnLoad();
    inputStatusPasien.on('select2:select', function (e) {
        if (e.params.data.id == "sembuh" ) {
            meninggalHide();
            inputMeninggal.val('');
            sembuhShow();
        }else if (e.params.data.id == "meninggal" ){
            sembuhHide();
            inputSembuh.val('');
            meninggalShow();
        }else{
            sembuhHide();
            inputSembuh.val('');
            meninggalHide();
            inputMeninggal.val('');
        }
    });
}());