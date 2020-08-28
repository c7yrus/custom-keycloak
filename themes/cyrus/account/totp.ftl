<#import "template.ftl" as layout>
<@layout.mainLayout active='totp' bodyClass='totp'; section>

    <div class="header-container">
        <div class="row">
            <div class="header-title">
                <h1>${msg("authenticatorTitle")}</h1>
            </div>
        </div>
        <#if totp.otpCredentials?size == 0>
            <div class="subtitle">
                <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
            </div>
        </#if>
    <hr id="hr-line">
    </div>

    <#if totp.enabled>
        <table class="">
            <thead>
            <#if totp.otpCredentials?size gt 1>
                <tr>
                    <th colspan="4">${msg("configureAuthenticators")}</th>
                </tr>
            <#else>
                <tr>
                    <th colspan="3">${msg("configureAuthenticators")}</th>
                </tr>
            </#if>
            </thead>

            <tbody>
            <#list totp.otpCredentials as credential>
                <tr>
                    <td class="provider">${msg("mobile")}</td>
                    <#if totp.otpCredentials?size gt 1>
                        <td class="provider">${credential.id}</td>
                    </#if>
                    <td class="provider">${credential.userLabel!}</td>
                    <td class="action">
                        <form action="${url.totpUrl}" method="post" class="form-inline">
                            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                            <input type="hidden" id="submitAction" name="submitAction" value="Delete">
                            <input type="hidden" id="credentialId" name="credentialId" value="${credential.id}">
                            <button id="remove-mobile" class="btn btn-default">
                                <i class="pficon pficon-delete"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
        <#else>

    <div class="form-container-expanded-totp">
    <ol>
        <div class="list-totp">
            <li>
                <p class="description-totp">${msg("totpStep1")}</p>

                <ul>
                    <#list totp.policy.supportedApplications as app>
                        <li class="description-totp">${app}</li>
                    </#list>
                </ul>
            </li>
        </div>

        <#if mode?? && mode = "manual">
                <li>
                    <p>${msg("totpManualStep2")}</p>
                    <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                    <p><a href="${totp.qrUrl}" id="mode-barcode">${msg("totpScanBarcode")}</a></p>
                </li>
                <li>
                    <p>${msg("totpManualStep3")}</p>
                    <ul>
                        <li id="kc-totp-type">${msg("totpType")}: ${msg("totp." + totp.policy.type)}</li>
                        <li id="kc-totp-algorithm">${msg("totpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                        <li id="kc-totp-digits">${msg("totpDigits")}: ${totp.policy.digits}</li>
                        <#if totp.policy.type = "totp">
                            <li id="kc-totp-period">${msg("totpInterval")}: ${totp.policy.period}</li>
                        <#elseif totp.policy.type = "hotp">
                            <li id="kc-totp-counter">${msg("totpCounter")}: ${totp.policy.initialCounter}</li>
                        </#if>
                    </ul>
                </li>
        <#else>
            <div class="list-totp">
                <li>
                    <p class="description-totp">${msg("totpStep2")}</p>
                    <p class="description-totp"><img src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"></p>
                    <p class="description-totp"><a href="${totp.manualUrl}" id="mode-manual">${msg("totpUnableToScan")}</a></p>
                </li>
            </div>
        </#if>
        <div class="list-totp">
            <li>
                <p class="description-totp">${msg("totpStep3")}</p>
                <p class="description-totp">${msg("totpStep3DeviceName")}</p>
            </li>
        </div>
    </ol>
    </div>

    <hr/>

    <form action="${url.totpUrl}" class="form-horizontal" method="post">
    <div class="form-container-totp">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <div class="form-group">
            <label for="totp">${msg("authenticatorCode")}</label> <span class="required">*</span>
            <input type="text" id="totp" name="totp" autocomplete="off" autofocus>
            <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}"/>
        </div>

        <div class="form-group" ${messagesPerField.printIfExists('userLabel',properties.kcFormGroupErrorClass!)}">
            <label for="userLabel">${msg("totpDeviceName")}</label> <#if totp.otpCredentials?size gte 1><span class="required">*</span></#if>
            <input type="text" id="userLabel" name="userLabel" autocomplete="off">
        </div>

        <div class="form-group">
            <div class="row-buttons-authenticators">
                <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                    <button type="submit" id="saveTOTPBtn" name="submitAction" value="Save">${msg("doSave")}</button>
                    <button type="cancel" id="cancelTOTPBtn" name="submitAction" value="Cancel">${msg("doCancel")} </button>
            </div>
        </div>

    </div>
    </form>
    </#if>

</@layout.mainLayout>
