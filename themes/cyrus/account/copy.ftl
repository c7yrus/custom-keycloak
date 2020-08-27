<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

    <div class="header-container">
        <div class="row">
        <div class="header-title">
            <h2>${msg("changePasswordHtmlTitle")}</h2>
        </div>
    </div>
    <div class="subtitle">
        <span class=""><span class="required">*</span> ${msg("All fields required")}</span>
    </div>
    <hr id="hr-line">
    </div>

    <div class="form-container">

    <form action="${url.passwordUrl}" class="form-horizontal" method="post">

    <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">

    <#if password.passwordSet>
        <div class="">
          <div class="">
            <input type="password" class="form-control" id="password" name="password" autofocus autocomplete="current-password">
          </div>
      </div>
    </#if>

    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

    <div class="">
        <div class="">
             <input type="password" class="form-control" id="password-new" name="password-new" autocomplete="new-password">
        </div>
    </div>

    <div class="">
        <div class="">
            <input type="password" class="form-control" id="password-confirm" name="password-confirm" autocomplete="new-password">
        </div>
    </div>


    <div class="form-group">
        <div id="">
            <div class="row-buttons">
                <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                <button type="submit" name="submitAction" value="Save">${msg("doSave")}</button>
                <button type="save" name="submitAction" value="Save">${msg("doSave")}</button>
                <button type="cancel"  name="submitAction" value="Cancel">${msg("doCancel")}</button>
            </div>
        </div>
    </div>

    </form>
    </div>

</@layout.mainLayout>
