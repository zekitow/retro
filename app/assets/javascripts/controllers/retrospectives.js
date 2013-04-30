jQuery(function($) {

    // Retrospectives Alert Error
    function retrospectivesAlertError(title, body)
    {
        // Show Error Alert
        $("#retrospectives-alert-error").find('h4').html(title);
        $("#retrospectives-alert-error").find('p').html(body);
        $("#retrospectives-alert-error").removeClass('hide');
    };

    // Error Alert Strings
    var error_title_alert = 'Erro ao Excluir!';
    var error_body_alert  = 'Não foi possível excluir o Registro, atualize a página e tente novamente.';

    $('.btn-delete-good').click(function() {
        // Good Code
        var good_code = $(this).parent().find('input[type=hidden]').val();
        // Good Form Selector
        var good_form_selector = 'form[name=delete_good]';

        // Refactoring Action Form with Good Id
        $(good_form_selector).attr('action', $(good_form_selector).attr('action') + '/' + good_code);

        // Dinamic Remove Tr Register Success
        $(good_form_selector).on('ajax:success', function(event, data, status, xhr) {
            $('#good-' + data.id).remove();
            // Close Modal
            $(good_form_selector).find('button[data-dismiss=modal]').click();
            // Refactoring Action Form
            $(good_form_selector).attr('action', $(good_form_selector).attr('action').replace('/' + good_code, ""));
        });

        // Dinamic Remove Tr Register Fail
        $(good_form_selector).on('ajax:error', function(event, data, status, xhr) {
            // Close Modal
            $(good_form_selector).find('button[data-dismiss=modal]').click();
            // Show Error on Delete
            retrospectivesAlertError(error_title_alert, error_body_alert);
            // Refactoring Action Form
            $(good_form_selector).attr('action', $(good_form_selector).attr('action').replace('/' + good_code, ""));
        });
    });

    $('.btn-delete-bad').click(function(){
        // Bad Code
        var bad_code = $(this).parent().find('input[type=hidden]').val();
        // Bad Form Selector
        var bad_form_selector = 'form[name=delete_bad]';

        // Refactoring Action Form with Bad Id
        $(bad_form_selector).attr('action', $(bad_form_selector).attr('action') + '/' + bad_code);

        // Dinamic Remove Tr Register Success
        $(bad_form_selector).on('ajax:success', function(event, data, status, xhr) {
            $('#bad-' + data.id).remove();
            // Close Modal
            $(bad_form_selector).find('button[data-dismiss=modal]').click();
            // Refactoring Action Form
            $(bad_form_selector).attr('action', $(bad_form_selector).attr('action').replace('/' + bad_code, ""));
        });

        // Dinamic Remove Tr Register Fail
        $(bad_form_selector).on('ajax:error', function(event, data, status, xhr) {
            // Close Modal
            $(bad_form_selector).find('button[data-dismiss=modal]').click();
            // Show Error on Delete
            retrospectivesAlertError(error_title_alert, error_body_alert);
            // Refactoring Action Form
            $(bad_form_selector).attr('action', $(bad_form_selector).attr('action').replace('/' + bad_code, ""));
        });

    });
});