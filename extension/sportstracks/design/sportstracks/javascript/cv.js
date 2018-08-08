/**
 * Created by maxence on 03/04/16.
 */
$(function()
{
    $('#intro h4').each(function(index){
        $(this).attr('id','heading'+index);
        var i = index+1;

        $("#tableOfContent ul").append( ' <li><a href="#'+$(this).attr('id')+'">'+i+'-'+$(this).html()+'</a>  </li>');
        $(this).wrap('<a href="#tableOfContent" class="nodecoration"><a>');
    });
    $("#tableOfContent ul").append('<li><a href="#contactForm"  class="upper">Contact</a></li>');

    $("#contactSubmit").click(function(){

        var formVars = { sendSms: $("#sendMethod input:checked").val(),senderCopy:$("#senderCopy").is(":checked") ,senderEmail: $("#senderEmail").val(), senderMessage: $('#senderMessage').val(), senderSubject: $('#senderSubject').val() };
        formProcessStart(formVars);



    });
});


function isValidEmailAddress(emailAddress) {
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    return pattern.test(emailAddress);
};

function formHandleMessage( message ){

    $(".contactForm .alert").remove();
    if($(message).hasClass('alert-success'))
    {
        $(".contactForm").children().hide();
        $(".contactForm").append(message);
    }
    else
    {
        $(".contactForm").prepend(message);
        $(".contactForm").children().show();
        $('.submitbutton').show();
    }
}

function formProcessStart(formVars) {
    window.location.href = "#contactForm";




    if (!isValidEmailAddress(formVars.senderEmail)) {
        formHandleMessage('<div class="alert alert-danger">'+contactFormMessage.invalidEmail+'<div>');
        return false;

    }
//console.log(formVars.senderSubject);

    if (  formVars.senderMessage  != '' &&  formVars.senderSubject != '' ) {
        $('.submitbutton').hide();
        $(".contactForm").children().hide();
        $(".contactForm").append(' <div class="loader"></div>');
    }
    else {
        formHandleMessage('<div class="alert alert-danger">'+contactFormMessage.emptyFields+'<div>');
        return false;

    }
    $.post("/sportstracks/sendmail", formVars)
        .done(function (data) {
            ;
            if (!data[0].error) {
                formHandleMessage('<div class="alert alert-success">'+contactFormMessage.contactSuccess+'</div>');
            }


        }).fail(function () {
            formHandleMessage('<div class="alert alert-danger">'+contactFormMessage.contactFails+'<div>');


        })
        .always(function () {
            $(".loader").remove();

        });



}


/*
* Manages menu links and links clicks anmations
* */
$(function() {
    $("body").css('display','block');
    $("body").addClass('fadeInLeft');
    headingCliked=false;


    $("#tableOfContent a").click(function(e){
        if( headingCliked ) {
            //console.log(headingCliked);
            $("article").attr('style', 'display:block;');
            $("article").removeClass('animated fadeOutLeft')
            $("article").addClass('animated fadeInLeft');

            var frstHeading = $("#intro h4")[0];

            $(frstHeading).parent().before($("#contactForm h3")[0]);
                $("article").append($("#downloadPdf"));
                headingCliked = false;
        }
        else{
           if ($("article").hasClass('fadeInLeftBig'))
           {
               $("article").removeClass('animated fadeInLeftBig');
               $("article").addClass('animated fadeInLeft');

           }
            else
           {

               $("article").removeClass('animated fadeInLeft');
               $("article").addClass('animated fadeInLeftBig');


           }
            $("article").removeClass('animated');

        }
    });

    $("[id^=heading]").click(function(e){
        if( !headingCliked )
        {
            e.preventDefault();
            $("article").addClass('animated fadeOutLeft');

            var windowLoc = '';
            var idContact =  $(this).attr('id');
            var isContactClicked = (idContact == 'headingMail');

            if ( isContactClicked )
            {
                windowLoc = '#'+idContact;
            }

           setTimeout(function(){
               $("article").attr('style','display:none;');
                if(windowLoc != ''){
                    window.location =  windowLoc;
                }
               else
                {
                    window.location =  '#tableOfContent';
                }

                $("h3").attr('style', 'display:block;');
               $("#contactForm").prepend($("h3")[0]);
                $("#contactForm").prepend($("#downloadPdf"));


            }, 920);
            headingCliked = true;
        }

    });
});
