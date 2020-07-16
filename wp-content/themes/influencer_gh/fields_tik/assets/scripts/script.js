/* global fieldsTik*/
'use strict';
jQuery(document).ready(function ($) {
    if (!wp.oldEditor) {
        window.wp.oldEditor = wp.editor;
    }

    $('.row-tik').closest('.inside').addClass('inside-tik');

    function init($wrapper) {
        if (typeof $.fn.select2 === 'function') {
            $wrapper.find('.select2-container').remove();
            select2Init($wrapper.find('.select2-tik'));
            select2AjaxInit($wrapper.find('.select2_ajax-tik'));
        }


        if (typeof $.fn.datepicker === 'function') {
            $wrapper.find('.datepicker-input-tik').datepicker({
                dateFormat: 'yy-mm-dd',
                showAnim: 'slideDown',
            });
        }

        if (typeof $.fn.wpColorPicker === 'function') {
            colorPickerInit($wrapper.find('.colorpicker-input-tik'));
        }

        if (typeof $.fn.placepicker === 'function') {
            locationInit($wrapper.find('.placepicker_fields_tik'));
        }

        if (typeof $.fn.sortable === 'function') {
            $wrapper.find('.repeater-tik .repeater-tik-list').sortable({
                stop: function () {
                    $(this).trigger('repeater-drop-fields-tik');
                }
            });
        }
        if (typeof wp.oldEditor === 'object') {
            wpEditorInit($wrapper.find('.row-tik .wp-editor-wrap'));
        }

        linkFieldInit($wrapper);


    }

    init($('body'));

    function setCookie(name, value, days) {
        var d = new Date();
        d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
        document.cookie = name + "=" + value + ";expires=" + d.toUTCString() + ";path=/";
    }

    function getCookie(name) {
        var value = "; " + document.cookie;
        var parts = value.split("; " + name + "=");
        if (parts.length === 2) return parts.pop().split(";").shift();
    }


    //select2 init
    function select2Init($el) {
        $el.each(function () {
            $(this).select2({
                allowClear: $(this).attr('data-allow-null'),
                placeholder: "",
            });
        });
    }

    function select2AjaxInit($el) {
        $el.each(function () {
            var $this = $(this);
            var data;

            var json = $this.closest('.select2_ajax_wrapper-tik').find('template').html();
            try {
                data = JSON.parse(json);
            } catch (er) {
                console.warn(er);
                return
            }

            if (data.values && data.values.length) {
                $.ajax({
                    url: fieldsTik.ajaxUrl,
                    method: 'POST',
                    dataType: 'json',
                    data: {
                        action: 'get_data_query_fields_tik',
                        query: data.query,
                        ids: data.values,
                        _: data._,
                    }
                }).done(function (res) {
                    _select2AjaxInit(res);
                    $this.val(data.values[0]).change()
                }).fail(function (err) {
                    console.warn(err);
                });
            } else {
                _select2AjaxInit(null)
            }


            function _select2AjaxInit(initialData) {
                $this.select2({
                    data: initialData,
                    allowClear: $(this).attr('data-allow-null'),
                    placeholder: "",
                    escapeMarkup: function (text) {
                        return text
                    },
                    templateResult: function (data) {
                        return data.text
                    },
                    templateSelection: function (data) {
                        return data.text
                    },
                    ajax: {
                        url: fieldsTik.ajaxUrl,
                        method: 'POST',
                        dataType: 'json',
                        data: function (params) {
                            return {
                                action: 'get_data_query_fields_tik',
                                query: data.query,
                                s: params.term,
                                page: params.page || 1,
                                _: data._,
                            };
                        },
                        processResults: function (data) {
                            return {
                                results: data,
                                pagination: {
                                    more: data.length === 20,
                                }
                            };
                        },
                    },
                });
            }


        });
    }

    //location picker init
    function locationInit($el) {
        $el.each(function (key) {
            var $wrapper = $(this).closest('.location-tik');
            $wrapper.attr('data-key', key);
            $wrapper.find('.placepicker-map_fields_tik').html('');
            $(this).data('placepicker', null);
            $(this).placepicker({
                longitudeInput: $wrapper.find('.longitude'),
                latitudeInput: $wrapper.find('.latitude'),
                placeChanged: function (place) {
                    $('.location-tik[data-key="' + key + '"]').trigger("location-change", this, place);
                }
            });
        });
    }

    //colorpicker init
    function colorPickerInit($el) {
        $el.each(function () {
            var $wrapper = $(this).closest('.input-wrapper');
            var $input = $wrapper.find('.colorpicker-input-tik');
            $wrapper.html($input);
            $(this).wpColorPicker({
                change: function (event, ui) {
                    var color = ui.color.toString();
                    $wrapper.find('.color-input-tik').val(color);
                    $wrapper.find('.color-input-tik').css({
                        background: 'linear-gradient(to right, white 0, white 40%, ' + color + ' 90%)'
                    });

                },
            });
            $wrapper.find('.wp-picker-container').append('<input class="color-input-tik" />');
            var color = $wrapper.find('.colorpicker-input-tik').val();
            $wrapper.find('.color-input-tik').val(color);
            if (color) {
                $wrapper.find('.color-input-tik').css({
                    background: 'linear-gradient(to right, white 0, white 40%, ' + color + ' 90%)'
                });
            }

        });
    }

    //wpEditor init

    function wpEditorInit($el) {
        $el.each(function () {
            var index = $(this).closest('.repeater-tik-item').index();
            if (index === 0) {
                return true;
            }
            var $wrapper = $(this).closest('.input-wrapper');
            var $textarea = $(this).find('.wp-editor-area');
            var initialId = $textarea.attr('id');
            var id = initialId.replace(/_\d+$/, '_' + index);
            $textarea.attr('id', id);
            $(this).replaceWith($textarea);
            wp.oldEditor.initialize(id, {
                tinymce: tinyMCEPreInit.mceInit[initialId],
                quicktags: tinyMCEPreInit.qtInit[initialId],
                mediaButtons: true,
            });
            $wrapper.find('.mce-container').show();
            $('#' + id + '_ifr').css({height: 200});

        });
    }

    function linkFieldInit($wrapper) {
        $wrapper.find('.link-title').each(function () {
            var title = $(this).closest('.input-wrapper').find('.link-input-text').val();
            $(this).html(title);
        });
        $wrapper.find('.link-url').each(function () {
            var href = $(this).closest('.input-wrapper').find('.link-input-url').val();
            $(this).attr('href', href).html(href)
        });
    }

    //colorpicker
    $(function () {
        $(document).on('change', '.color-input-tik', function () {
            var color = $(this).val();
            $(this).closest('.wp-picker-container')
                .find('.colorpicker-input-tik')
                .val(color).change()
        });
        $(document).on('focus', '.color-input-tik', function () {
            $(this).closest('.wp-picker-container')
                .find('.wp-color-result')
                .click()
        });
    });

    //location picker
    $(function () {
        $(document).on('location-change', '.location-tik', function (ev, placePicker) {
            var $wrapper = $(this);
            var location = placePicker.getLocation();
            $wrapper.find('.longitude').val(location.longitude).trigger('change');
            $wrapper.find('.latitude').val(location.latitude).trigger('change');
        });

        $(document).on('click', '.toggle_placepicker_fields_tik', function (ev) {
            ev.preventDefault();
            var $wrapper = $(this).closest('.location-tik');
            $wrapper.find('.placepicker-map-wrapper').slideToggle(400, function () {
                // $(window).resize();
            });
        })
    });

    //Repeater
    $(function () {

        //add new item
        $(document).on('click', '.repeater-tik-new-item', function () {
            var $wrapper = $(this).closest('.repeater-tik');
            var $list = $wrapper.children('.repeater-tik-list');
            var html = $list.children('.repeater-tik-item').get(0).outerHTML;
            $list.append(html);
            var $newItem = $list.children('.repeater-tik-item').last();
            $newItem.find(':input').val('');
            $newItem.find('.attachment-wrapper img').attr('src', fieldsTik.mimeTypeIcon);
            $newItem.find('.attachment-wrapper .text').html('');
            $newItem.hide().slideDown();
            setIndexes($wrapper);

            init($newItem);
        });

        $(document).on('click', '.repeater-tik-delete-item', function () {
            var $wrapper = $(this).closest('.repeater-tik');
            var $row = $(this).closest('.repeater-tik-item');
            $row.slideUp(null, function () {
                $row.remove();
                setIndexes($wrapper);
            });
        });

        $('.repeater-tik-list').on('repeater-drop-fields-tik', setIndexes);


        function setIndexes($wrapper) {
            $wrapper = $wrapper.target ? $($wrapper.target) : $wrapper;
            var i = 0;

            var $item = $wrapper.hasClass('repeater-tik-list') ?
                $wrapper.children('.repeater-tik-item') :
                $wrapper.children('.repeater-tik-list').children('.repeater-tik-item');

            $item.each(function () {
                $(this).attr('data-key', i);
                var nestedLevel = $(this).parents('.repeater-tik-item').length;
                var regStr = '^(fields_tik\\[[^\\]]+\\]';
                for (var j = 0; j < nestedLevel; j++) {
                    regStr += '\\[\\d+]\\[[^\\]]+\\]';
                }
                regStr += '\\[)(\\d+)';
                var reg = new RegExp(regStr);
                $(this).find('[name]').each(function () {
                    var attrName = $(this).attr('name').replace(reg, '$1' + i);
                    $(this).attr('name', attrName)
                });

                $(this).find('sup').text((i + 1) + '.');
                i++
            });
        }
    });

    //file_input
    $(function () {
        $(document).on('click', '.add-file-field-tik', function () {
            var $currentBtn = $(this);
            var file_uploader = wp.media({
                library: {type: $currentBtn.attr('data-type')},
                button: {text: fieldsTik.i18n['Select']},
                multiple: true,
            }).on('select', function () {
                var selection = file_uploader.state().get('selection');

                var key = $currentBtn.closest('.repeater-tik-item').attr('data-key');
                var $wrapper = $currentBtn.closest('.repeater-tik');
                var first = true;
                selection.map(function (attachment) {
                    attachment = attachment.toJSON();
                    var $btn;
                    if (first) {
                        first = false;
                        $btn = $currentBtn;
                    } else {
                        $wrapper.find('.repeater-tik-new-item').click();
                        $btn = $wrapper.find('.repeater-tik-item[data-key="' + key + '"] .add-file-field-tik');
                    }
                    key++;
                    $btn.find('input').val(attachment.id).change();
                    if ('sizes' in attachment) {
                        var src;
                        try {
                            src = attachment.sizes.thumbnail.url;
                        } catch (e) {
                            src = attachment.url;
                        }
                        $btn.find('img').attr('src', src);
                    } else {
                        $btn.find('img').attr('src', attachment.icon);
                    }
                    $btn.find('.text').html(attachment.filename);
                });


            }).open();
        });

        $(document).on('click', '.delete-file-tik', function (ev) {
            ev.preventDefault();
            ev.stopPropagation();

            var $wrapper = $(this).closest('.input-wrapper');
            $wrapper.find('.file-input').val('');
            $wrapper.find('.text').html('');
            $wrapper.find('img').replaceWith('<img src="' + fieldsTik.siteUrl + '/wp-includes/images/media/default.png" alt=""/>');
        });
    });

    //tabs hide/show
    $(function () {
        $(document).on('click', '.nav-tab-wrapper-tik a', function (ev) {
            ev.preventDefault();
            var tabId = $(this).attr('href');
            var $tab = $(tabId);
            if (!$tab.is(':visible')) {
                var $wrapper = $(this).closest('.nav-tab-wrapper-tik');
                $wrapper.find('.nav-tab').removeClass('nav-tab-active');
                $(this).addClass('nav-tab-active');
                $wrapper.siblings().hide();
                $tab.show();

                setCookie('active-tab-fields-tik', tabId, 1);
            }
        });

        var tabId = getCookie('active-tab-fields-tik');
        if (tabId) {
            $('a[href="' + tabId + '"]').trigger('click');
        }
    });

    //link_input
    $(function () {
        $("#wp-link-textarea-tik-wrap").hide().appendTo("body");

        var $wrapper = null;

        $(document).on('click', '.link-tik .link-btn-tik', function (ev) {
            ev.preventDefault();
            $wrapper = $(this).closest('.link-tik');

            wpLink.open('link-textarea-tik');

            setTimeout(function () {
                $('#wp-link-url').val($wrapper.find('.link-url').attr('href'));
                $('#wp-link-text').val($wrapper.find('.link-title').html());
                $('#wp-link-target').prop('checked', '_blank' === $wrapper.find('.link-input-target').val());
            }, 100);

            return false;
        });

        $(document).on('click', '#wp-link-submit', function (ev) {
            ev.preventDefault();
            ev.stopPropagation();

            var linkAttrs = wpLink.getAttrs();
            var text = $('#wp-link-text').val();
            $wrapper.find('.link-url').attr('href', linkAttrs.href).html(linkAttrs.href);
            $wrapper.find('.link-title').html(text);


            $wrapper.find('.link-input-url').val(linkAttrs.href).change();
            $wrapper.find('.link-input-text').val(text);
            $wrapper.find('.link-input-target').val(linkAttrs.target);

            wpLink.textarea = $('body');
            wpLink.close();
            $('#link-textarea-tik').val('');

            return false;
        });

        $(document).on('click', '#wp-link-cancel, #wp-link-close', function (ev) {
            ev.preventDefault();
            ev.stopPropagation();

            wpLink.textarea = $('body');
            wpLink.close();

            return false;
        });
    });


});