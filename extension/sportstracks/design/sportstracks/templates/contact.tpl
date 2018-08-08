<div id="contactForm">
    <h3>Contact</h3>
    <form class="contactForm form-horizontal" role="form">
        <div id="sendMethod" class="form-group">


            <label class="control-label col-sm-3">{'Contact method'|i18n('form')}</label>
            <div class="col-sm-6">
                <label for="smsFalse" class="radio-inline"><input id="smsFalse"  type="radio" name="sendSms" value="0" checked>Email</label>
                <label for="smsTrue" class="radio-inline"><input id="smsTrue"  type="radio" name="sendSms" value="1" >SMS</label>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="senderSubject">{'Subject'|i18n('form')}</label>

            <div class="col-sm-6">
                <input id="senderSubject" class="form-control" type="text" name="senderSubject">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="senderEmail">{'Your email address'|i18n('form')}</label>

            <div class="col-sm-6">
                <input id="senderEmail" class="form-control" type="email" name="senderEmail">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="senderMessage">Message</label>
            <div class="col-sm-6">
                <textarea  id="senderMessage" class="form-control" name="senderMessage"></textarea>
            </div>
        </div>
        {*<div class="form-group">
            <label class="control-label col-sm-5" for="senderSubject">{'Email me a copy'|i18n('form')}</label>
            <div class="col-sm-2">
                <input id="senderCopy" class="form-control" type="checkbox" name="senderCopy">
            </div>
        </div>*}

    </form>

    <div class="submitbutton">
        <button id="contactSubmit" type="button" class="btn btn-primary ">
            {"Send"|i18n('form')}:</button>
    </div>
</div>

<script type="text/javascript">
    var contactFormMessage = {literal}
    {
        {/literal}
        invalidEmail: "{'invalidEmail'|i18n('form')}",
        emptyFields: "{'emptyFields'|i18n('form')}",
        contactSuccess: "{'contactSuccess'|i18n('form')}",
        contactFails: "{'contactFails'|i18n('form')}" {literal}
    }
    {/literal}
    //console.log(contactFormMessage);

</script>
