<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <div class="header-container">
    <div class="row">
        <div class="header-title">
            <h1>${msg("editAccountHtmlTitle")}</h1>
        </div>
    </div>
    <div class="subtitle">
        <span class=""><span class="required">*</span> ${msg("All fields required")}</span>
    </div>
    <hr id="hr-line">
    </div>

    <div class="form-container">

    <form action="${url.accountUrl}" class="form-horizontal" method="post">

    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

    <#if !realm.registrationEmailAsUsername>
        <div class="form-group ${messagesPerField.printIfExists('username','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="username" class="control-label">${msg("username")}</label> <#if realm.editUsernameAllowed><span class="required">*</span></#if>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
            </div>
        </div>
    </#if>

    <div class="form-group ${messagesPerField.printIfExists('email','has-error')}">
        <input type="text" placeholder="${msg("email ")}"  id="email" name="email" autofocus value="${(account.email!'')}"/>
    </div>

    <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">
        <input type="text" placeholder="${msg("first name ")}"  id="firstName" name="firstName" value="${(account.firstName!'')}"/>
    </div>

    <div class="form-group ${messagesPerField.printIfExists('lastName','has-error')}">
        <input type="text" placeholder="${msg("last name ")}"  id="lastName" name="lastName" value="${(account.lastName!'')}"/>
    </div>

    <div class="form-group">
        <div class="row-buttons">
            <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
            <button type="save" name="submitAction" value="Save">${msg("doSave")}</button>
            <button type="cancel"  name="submitAction" value="Cancel">${msg("doCancel")}</button>
        </div>
    </div>

    </form>
    </div>

</@layout.mainLayout>
