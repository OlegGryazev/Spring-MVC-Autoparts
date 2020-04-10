<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    Add new user
    <div style="color:red">
        ${message!}
    </div>
    <@l.login "/registration" true/>
</@c.page>