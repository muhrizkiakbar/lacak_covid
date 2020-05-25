$('.modal-edit, .modal-new').on('hidden.bs.modal', function (e) {
    $(this).find('form').remove();
});

$('div.notifikasi').show(function(){
    notifMessage = $(this).data('notifikasi');
    $.notify({
        icon: "fas fa-bell",
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
    $('input, textarea').on('focus', function() {
        $(this).closest('.form-group').removeClass('has-danger');
        $(this).removeClass('is-invalid');
    });
}
clearIsInvalid();

function toggleInter(inputTrigger, input){
    isChecked = $(inputTrigger).prop("checked");
    $.each(input, function (index, value){
        if (isChecked) {
            value.prop("disabled", false);
        } else {
            value.attr("value", "");
            value.val("").trigger("change");
            value.prop("disabled", true);
        }
    });
}

$('form').on('submit', function(e){
    $(this).each(function(){
        $(this).find(':input:disabled').prop("disabled", false);
    });
});


// Form 11-3
(function () {
    selectPatient = $("#lampiran_eleven_close_contact_information_main_patient_id");
    selectMessage = $("#lampiran_eleven_close_contact_information_telegram_message_closecont_reporter_id");
    selectPatient.on("select2:open", function () {
        selectMessage = $("#lampiran_eleven_close_contact_information_telegram_message_closecont_reporter_id");
        selectMessage.val("").trigger("change");
    });
    selectMessage.on("select2:open", function () {
        selectPatient = $("#lampiran_eleven_close_contact_information_main_patient_id");
        selectPatient.val("").trigger("change");
    });
})();
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
(function() {

    interCheckBox = $('#lampiran_eleven_close_contact_question_number_1');
    interTextField = $('#lampiran_eleven_close_contact_answer_qn_1');
    interDateField = $('#lampiran_eleven_close_contact_date_question_number_1');
    domestikCheckBox = $('#lampiran_eleven_close_contact_question_number_2');
    domestikDari = $('#lampiran_eleven_close_contact_start_travel_qn_2_id');
    domestikKe = $('#lampiran_eleven_close_contact_end_travel_qn_2_id');
    domestikDateField = $('#lampiran_eleven_close_contact_date_question_number_2');
    contactCheckBox = $('#lampiran_eleven_close_contact_question_number_3');
    contactTextField = $('#lampiran_eleven_close_contact_date_question_number_3');
    
    toggleInter(interCheckBox, [interDateField, interTextField]);
    toggleInter(domestikCheckBox, [domestikDari, domestikKe, domestikDateField]);
    toggleInter(contactCheckBox, [contactTextField]);
    interCheckBox.on('change', function () {
        toggleInter($(this), [interDateField, interTextField]);
    });
    domestikCheckBox.on('change', function () {
        toggleInter($(this), [domestikDari, domestikKe, domestikDateField]);
    });
    contactCheckBox.on('change', function () {
        toggleInter($(this), [contactTextField]);
    });
}());

// Form 11-4.2
(function() {
    kontakCheckBox = $('#lampiran_eleven_close_contact_info_home_is_room_contact_or_activity');
    kontakTextField = $('#lampiran_eleven_close_contact_info_home_number_of_days_of_contact_activity');
    toggleInter(kontakCheckBox, [kontakTextField]);
    kontakCheckBox.on('change', function () {
        toggleInter($(this), [kontakTextField]);
    });
}());

// Form 11-5
(function() {
    select2WorkPlace = $('.lokasi-kerja');
    function selectedWorkPlace (inputSelect, inputRadio) {
        inputSelect.each(function (index, value) {
            if (inputRadio == $(value).data("selected")) {
                $(value).prop("disabled", false);
            } else {
                $(value).val("").trigger("change");
                $(value).prop("disabled", true);
            }
        });
    }
    function getInitRadio () {
        var returnValue = null;
        $('input[name="radio-kerja"]').each(function (index, value) {
            if ($(value).prop("checked")){
                returnValue = value.id;
            }
        });
        return returnValue;
    }
    selectedWorkPlace(select2WorkPlace, getInitRadio());    
    $('input[name="radio-kerja"]').on('change', function () {
        selectedWorkPlace(select2WorkPlace, getInitRadio());
    });


    var confirmCaseAPD = $('.confirm-case');
    var triggerCaseAPD = $('#lampiran_eleven_info_exposes_officer_is_contact_physic_with_positive');

    function toggleAPD(inputTrigger, input){
        isChecked = $(inputTrigger).prop("checked");
        $.each(input, function (index, value){
            if (isChecked) {
                $(value).prop("disabled", false);
            } else {
                $(value).prop("checked", false);
                $(value).prop("disabled", true);
            }
        });
    }

    toggleAPD(triggerCaseAPD, confirmCaseAPD);
    triggerCaseAPD.on('change', function(){
        toggleAPD($(this), confirmCaseAPD);
    });

    var confirmAeroAPD = $('.confirm-aerosol');
    var textAero = $('#lampiran_eleven_info_exposes_officer_explain_of_procedure_aerosol');
    var triggerAeroAPD = $('#lampiran_eleven_info_exposes_officer_is_procedure_aerosol');
    if (triggerCaseAPD.prop("checked")) {
        textAero.prop("disabled", false);
    } else {
        textAero.val("").trigger("change");
        textAero.prop("disabled", true);
    }
    toggleAPD(confirmAeroAPD, confirmAeroAPD);
    triggerAeroAPD.on('change', function(){
        toggleAPD($(this), confirmAeroAPD);
        if ($(this).prop("checked")) {
            textAero.prop("disabled", false);
        } else {
            textAero.val("").trigger("change");
            textAero.prop("disabled", true);
        }
    });


}());

// Form 11-5a
(function(){
    feverCheckBox = $('#lampiran_eleven_contact_symptom_is_fever');
    tempTextField = $('#lampiran_eleven_contact_symptom_explain_of_fever');
    toggleInter(feverCheckBox, [tempTextField]);
    feverCheckBox.on('change', function () {
        toggleInter($(this), [tempTextField]);
    });
}());

// Form 11-5b
(function(){
    throatCheckBox = $('#lampiran_eleven_respiratory_symptom_is_sore_throat');
    throatTextField = $('#lampiran_eleven_respiratory_symptom_date_of_sore_throat');
    coughCheckBox = $('#lampiran_eleven_respiratory_symptom_is_cough');
    coughTextField = $('#lampiran_eleven_respiratory_symptom_date_of_cough');
    fluCheckBox = $('#lampiran_eleven_respiratory_symptom_is_flu');
    fluTextField = $('#lampiran_eleven_respiratory_symptom_date_of_flu');
    breathCheckBox = $('#lampiran_eleven_respiratory_symptom_is_out_of_breath');
    breathTextField = $('#lampiran_eleven_respiratory_symptom_date_of_out_of_breath');

    toggleInter(throatCheckBox, [throatTextField]);
    toggleInter(coughCheckBox, [coughTextField]);
    toggleInter(fluCheckBox, [fluTextField]);
    toggleInter(breathCheckBox, [breathTextField]);

    throatCheckBox.on('change', function () {
        toggleInter($(this), [throatTextField]);
    });
    coughCheckBox.on('change', function () {
        toggleInter($(this), [coughTextField]);
    });
    fluCheckBox.on('change', function () {
        toggleInter($(this), [fluTextField]);
    });
    breathCheckBox.on('change', function () {
        toggleInter($(this), [breathTextField]);
    });
})();

// Form 11-5c
(function(){
    neurologisCheckbox = $('#lampiran_eleven_other_symptom_is_neurologis');
    neurologisTextField = $('#lampiran_eleven_other_symptom_tell_of_neurologis');
    toggleInter(neurologisCheckbox, [neurologisTextField]);
    neurologisCheckbox.on('change', function () {
        toggleInter($(this), [neurologisTextField]);
    });
}());

// Form 11-6
(function(){
    
    pregnantCheckbox = $('#lampiran_eleven_comorbid_condition_is_pregnant');
    pregnantChild = $('.pregnant-child');
    function togglePregnant(inputTrigger, inputChanged){
        isPregnant = $(inputTrigger).prop("checked");
        $.each(inputChanged, function (index, value){
            if (isPregnant) {
                $(value).prop("disabled", false);
            } else {
                if ($(value).attr("type") == "checkbox"){
                    $(value).prop("checked", false);
                } else if ($(value).attr("type") == "text") {
                    $(value).attr("value", "");
                    $(value).val("").trigger("change");
                }
                $(value).prop("disabled", true);
            }
        });
    }
    togglePregnant(pregnantCheckbox, pregnantChild);
    pregnantCheckbox.on('change', function () {
        togglePregnant(pregnantCheckbox, pregnantChild);
    });

    vaccineCheckbox = $('#lampiran_eleven_comorbid_condition_is_influenza_vaccine');
    vaccineDateField = $('#lampiran_eleven_comorbid_condition_date_of_influenza_vaccine');
    vaccineTextField = $("#lampiran_eleven_comorbid_condition_influenza_vaccine_in_the_country");
    toggleInter(vaccineCheckbox, [vaccineDateField, vaccineTextField]);
    vaccineCheckbox.on('change', function () {
        toggleInter($(this), [vaccineDateField, vaccineTextField]);
    });

    pvcCheckbox = $('#lampiran_eleven_comorbid_condition_is_pvc_vaccine');
    pvcDateField = $('#lampiran_eleven_comorbid_condition_date_of_pvc_vaccine');
    toggleInter(pvcCheckbox, [pvcDateField]);
    pvcCheckbox.on('change', function () {
        toggleInter($(this), [pvcDateField]);
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

    treatedCheckbox = $('#lampiran_eleven_contact_status_is_been_treated');
    treatedDateField = $('.treated-child');
    toggleInter(treatedCheckbox, [treatedDateField]);
    treatedCheckbox.on('change', function () {
        toggleInter($(this), [treatedDateField]);
    }); 

    diedCheckbox = $('#lampiran_eleven_contact_status_is_dead_with_autopsy');
    diedDateField = $('#lampiran_eleven_contact_status_result_of_autopsy');
    toggleInter(diedCheckbox, [diedDateField]);
    diedCheckbox.on('change', function () {
        toggleInter($(this), [diedDateField]);
    }); 
}());

(function() {
    specimenCheckbox = $('#lampiran_eleven_specimen_contact_type_of_specimen');
    specimenField = $('.specimen-child');
    function toggleSpecimen(inputTrigger, input){
        isSelected = ($(inputTrigger).val() == "") ? false : true;
        $.each(input, function (index, value){
            if (isSelected) {
                $(value).prop("disabled", false);
                } else {
                $(value).attr("value", "");
                $(value).val("").trigger("change");
                $(value).prop("disabled", true);
            }
        });
    }
    toggleSpecimen(specimenCheckbox, specimenField);
    specimenCheckbox.on("select2:select", function () {
        toggleSpecimen(specimenCheckbox, specimenField);
    });
}());

function chooseSurvWP(){
    select2SurvWorkPlace = $('.lokasi-kerja-surv');
    function selectedWorkPlace (inputSelect, inputRadio) {
        inputSelect.each(function (index, value) {
            if (inputRadio == $(value).data("selected")) {
                $(value).prop("disabled", false);
            } else {
                $(value).val("").trigger("change");
                $(value).prop("disabled", true);
            }
        });
    }
    function getInitRadio () {
        var returnValue = null;
        $('input[name="radio-kerja-surv"]').each(function (index, value) {
            if ($(value).prop("checked")){
                returnValue = value.id;
            }
        });
        return returnValue;
    }
    selectedWorkPlace(select2SurvWorkPlace, getInitRadio());    
    $('input[name="radio-kerja-surv"]').on('change', function () {
        selectedWorkPlace(select2SurvWorkPlace, getInitRadio());
    });
}

avatarUpload = function () {
    readURL = function(input) {
        if (input.files && input.files[0]) {
            reader  = new FileReader();
            reader.onload = function (e) {
                $('.dz-preview-img').attr('src', e.target.result);
                $('.dz-preview-img').closest('.dropzone').addClass("dz-max-files-reached");
                // $('.dz-message').height($('.dropzone').height());
                // $('.dz-message').css("padding", "calc(50% - 1rem) 1rem");
            };
            reader.readAsDataURL(input.files[0]);
        }
    };

    $('.avatar-input').on('change', function () {
        readURL(this);
    });

    $('.dz-message').on('click', function () {
        $('.avatar-input').click();
    });
};

avatarUpload();

(function(){
    function callOtherRemove (){
        otherCheckRemoveBtn = $(".removeListOtherCheck");
        otherCheckRemoveBtn.on('click', function () {
            $("#"+$(this).data("id")).remove();
        });
    }

    function checkNull(input){
        inputVal = input.val();
        if (inputVal == "" || inputVal == null) {
            input.addClass("is-invalid");
            input.closest("form-group").addClass("has-danger");
            return false;
        } else {
            return true;
        }
    }


    otherCheckNameField = $("#c_check_name");
    otherCheckDateField = $("#c_check_date");
    otherCheckPlaceField = $("#c_check_place");
    otherCheckResultField = $("#c_check_result");
    otherCheckAddBtn = $("#c_check_btn");
    otherCheckContainer = $("#listOtherCheckContainer");
    otherId = 0;

    function clearOthersCheck() {
        otherCheckNameField.val("");
        otherCheckDateField.val("");
        otherCheckPlaceField.val("");
        otherCheckResultField.val("");
    }

    function addToCheckContainer (data) {
        return '<tr id="'+data.id+'">'+
                '<td>'+
                    data.name+
                    '<input type="hidden" name="l_six_t_checkother[other_check][]" value="'+data.name+'">'+
                '</td>'+
                '<td>'+
                    data.date+
                    '<input type="hidden" name="l_six_t_checkother[date_check_other][]" value="'+data.date+'">'+
                '</td>'+
                '<td>'+
                    data.place+
                    '<input type="hidden" name="l_six_t_checkother[place_check_other][]" value="'+data.place+'">'+
                '</td>'+
                '<td>'+
                    data.result+
                    '<input type="hidden" name="l_six_t_checkother[result_check_other][]" value="'+data.result+'">'+
                '</td>'+
                '<td>'+
                    '<button class="btn btn-icon btn-sm btn-danger removeListOtherCheck" type="button" data-id="'+data.id+'">'+
                        '<span class="btn-inner--icon"><i class="fas fa-trash"></i></span>'+
                    '</button>'+
                '</td>'+
                '</tr>';
    }

    otherCheckAddBtn.on('click', function () {
        isNameNull = checkNull(otherCheckNameField);
        isDateNull = checkNull(otherCheckDateField);
        isPlaceNull = checkNull(otherCheckPlaceField);
        isResultNull = checkNull(otherCheckResultField);
        if  ( !(isNameNull && isDateNull && isPlaceNull && isResultNull) ) {
            return false;
        } else {
            otherName = otherCheckNameField.val();
            otherDate = otherCheckDateField.val();
            otherPlace = otherCheckPlaceField.val();
            otherResult = otherCheckResultField.val();
            resultObj = {
                id: otherId,
                name: otherName,
                date: otherDate,
                place: otherPlace,
                result: otherResult
            };
            otherCheckContainer.append(addToCheckContainer(resultObj));
            otherId += 1;
            callOtherRemove();
            clearOthersCheck();
            $('.modal').modal('hide');
        }
    });
}());

// Form 6A
(function(){
    selectMessage = $("#l_six_first_telegram_message_ili_reporter_id");
    selectPatient = $("#l_six_first_main_patient_id");
    selectPatient.on("select2:open", function () {
        selectMessage.val("").trigger("change");
    });
    selectMessage.on("select2:open", function () {
        selectPatient.val("").trigger("change");
    });
}());

// Form 6B
(function () {
    selectStatusPasien = $("#l_six_second_last_status_patient");
    tglMeninggalField = $("#l_six_second_date_of_die");
    // tglMeninggalLabel = $("#")
    function toggleHide(selectVal) {
        if (selectVal == "meninggal") {
            tglMeninggalField.siblings().show();
            tglMeninggalField.show();
        } else {
            tglMeninggalField.val("").trigger("change");
            tglMeninggalField.siblings().hide();
            tglMeninggalField.hide();
        }
    }
    toggleHide(selectStatusPasien.val());
    selectStatusPasien.on("select2:select", function (){
        selectVal = $(this).val();
        toggleHide(selectVal);
    });
}());