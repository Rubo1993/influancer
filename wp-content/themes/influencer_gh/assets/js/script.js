jQuery(document).ready(function ($) {
    // scrool smooth start
    $('a[href^="#"]').on('click',function (e) {
        e.preventDefault();
        var target = this.hash;
        var $target = $(target);
        $('html, body').stop().animate({
            'scrollTop': $target.offset().top
        }, 900, 'swing', function () {
            // window.location.hash = target;
        });
    });



    // scrool smooth end

    $(document).on('click', '#open_register_form', function () {
        $('.registration_popup').modal('show');
    });
    // modal
    $('#close_register_popup').click(function (ev) {
        ev.preventDefault();
        $('#registration_popup').fadeOut();
    });
    $('#close').click(function (ev) {
        ev.preventDefault();
        $('#myModal1').fadeOut();
    });


    $("body").click(function (ev) {
        if ($(ev.target).attr('id') == 'registration_popup' || $(ev.target).closest('#registration_popup').length) {
            return;
        }
        $("#registration_popup").fadeOut();
    });

    $('.registration_form').on('submit', function (ev) {
        $('.clear_messages').html('');
        $('.form-control').removeClass('is-invalid');
        var $form = $(this);

        var $step1 = $form.find('.registration_form_step_1');
        var $step2 = $form.find('.registration_form_step_2');
        var $step3 = $form.find('.registration_form_step_3');

        var $step2_slide = $form.find('.step_two_slid');
        var $step3_slide = $form.find('.step_three_slid');

        ev.preventDefault();
        $.ajax({
            url: influencer_gh.ajaxUrl,
            type: 'POST',
            data: $form.serialize(),
            dataType: 'json'
        }).done(function (response) {
            if (response.step_1_status == 'step_1_ok') {
                $step2.addClass('active');
                $step2_slide.addClass('active');
            }
            if (response.step_2_status == 'step_2_ok') {
                $step3.addClass('active');
                $step3_slide.addClass('active');
            }
            $.each(response.errors, function (key, value) {
                $form.find('.' + key).addClass('is-invalid');
                $form.find('.' + key + '_message').html(value);
            });

            if (response.errors.length === 0) {
                $form.get(0).reset();
                $('.countrySelect2').change();
                $('#successfully_registered_modal').modal('show');
                $('#advertiserRegistrationPopup').modal('hide');

            }
        });
    });
    // login_here


    // bloger registration start
    $('.bloger-registration').on('submit', function (ev) {
        $('.clear_messages').html('');
        $('.form-control').removeClass('is-invalid');
        ev.preventDefault();
        var $form = $(this);
        $.ajax({
            url: influencer_gh.ajaxUrl,
            type: 'POST',
            data: $form.serialize(),
            dataType: 'json'
        }).done(function (response) {
            $.each(response.errors, function (key, value) {
                $form.find('.' + key).addClass('is-invalid');
                $form.find('.' + key + '_message').html(value);
            });
            if (response.errors.length === 0) {
                $form.get(0).reset();
                $('#bloggerRegistrationPopup').modal('hide');
                $('#successfully_registered_modal').modal('show');
            }
        });
    });
    // bloger registration end

// registration subscriber start
    $('.register_subscriber').on('submit', function (ev) {
        $('.clear_messages').html('');
        $('.form-control').removeClass('is-invalid');
        var $form = $(this);
        ev.preventDefault();
        $.ajax({
            url: influencer_gh.ajaxUrl,
            type: 'POST',
            data: $form.serialize(),
            dataType: 'json'
        }).done(function (response) {
            $.each(response.errors, function (key, value) {
                $form.find('.' + key).addClass('is-invalid');
                $form.find('.' + key + '_message').html(value);
            });
            if (response.errors.length === 0) {
                $('#successfully_registered_subscriber').modal('show');
                $form.get(0).reset();
                $('.countrySelect2').change();
                $form.find('.' + key).addClass('is-invalid');
            }
        });
    });

// registration subscriber end
    $(".countrySelect2").change(function () {
        setTimeout(() => {
            var $phone = $('input[name="phone"]');
            var $country_code = $(this).children("option:selected").attr('data-phone-code') || '';
            $phone.val($country_code + " ");
        }, 5)
    });

    $('.select2').select2({
        placeholder: 'Select Networks',
        }
    );

    $('.countrySelect2').select2({
        placeholder: 'Select Country',
        ajax: {
            url: influencer_gh.ajaxUrl,
            dataType: 'json',
            data: function (params) {
                console.log(params)
                return {
                    action: 'get_countries_gh',
                    page: params.page || 1,
                    s: params.term || '',
                };
            },
            processResults: function (data) {
                var results = [];
                for (var code in data.countries) {
                    results.push({
                        id: data.countries[code].name,
                        text: data.countries[code].name,
                        phone: data.countries[code].phone,
                    })
                }
                return {
                    results: results,
                    pagination: {
                        more: data.currentPage < data.totalPages
                    }
                };
            }
        },
        templateSelection: function (container) {
            if (container.phone) {
                $(container.element).attr("data-phone-code", '+' + container.phone);
            }
            return container.text;
        }
    });
    $('.countrySelect2').next('.select2').addClass('reg_select');
    $('.select2').next('.select2').addClass('reg_select');
});