<#import "template.ftl" as layout>
<@layout.mainLayout active='social' bodyClass='social'; section>

    <div class="header-container">
        <div class="row">
            <div class="header-title-expanded">
                <h1>${msg("federatedIdentitiesHtmlTitle")}</h1>
            </div>
        </div>
    <hr id="hr-line">
    </div>

    <div class="form-container">
    <#list federatedIdentity.identities as identity>
        <div class="form-group">
            <label for="${identity.providerId!}" class="control-label">${identity.displayName!}</label>
            <input type="text" disabled="true" class="form-control" value="${identity.userName!}">
        </div>
        <div class="form-group">
            <#if identity.connected>
                <#if federatedIdentity.removeLinkPossible>
                    <form action="${url.socialUrl}" method="post" class="form-inline">
                        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                        <input type="hidden" id="action" name="action" value="remove">
                        <input type="hidden" id="providerId" name="providerId" value="${identity.providerId!}">
                        <button type="text" id="remove-link-${identity.providerId!}" class="btn btn-default">${msg("doRemove")}</button>
                    </form>
                </#if>
            <#else>
                <form action="${url.socialUrl}" method="post" class="form-inline">
                    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                    <input type="hidden" id="action" name="action" value="add">
                    <input type="hidden" id="providerId" name="providerId" value="${identity.providerId!}">
                    <button type="" id="add-link-${identity.providerId!}">${msg("doAdd")}</button>
                </form>
            </#if>
        </div>
    </div>
    </#list>
    </div>

</@layout.mainLayout>
