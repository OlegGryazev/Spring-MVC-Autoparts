<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div>
    <form method="post" action="add" enctype="multipart/form-data">
        <input type="text" name="article" placeholder="Введите артикул" />
        <input type="text" name="manufacturer" placeholder="Введите производителя" />
        <input type="file" name="file" />
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Добавить</button>
    </form>
    <div style="margin-top:10pt">
        <b>Filter:</b>
        <form method="get" action="/main">
            <input type="text" name="filterArticle" value = "${filterArticle!}" placeholder="Артикул"/>
            <input type="text" name="filterManufacturer" value = "${filterManufacturer!}" placeholder="Производитель"/>
            <button type="submit">Найти</button>
        </form>
    </div>
</div>

<div>Messages</div>
<#list parts as part>
    <div style="width:40pt">
    <form method="get" action="del">
        <input type="hidden" name="partid" value="${part.id}" />
        <button type="submit">del</button>
    </form>
    </div>
    <div>
        ${part.id}
        ${part.article}
        ${part.manufacturer}
        <strong>${part.authorName}</strong>
        <div>
            <#if part.filename??>
                <img src="/img/${part.filename}">
            </#if>
        </div>
    </div>
<#else>
    No parts.
</#list>
    <a href="/">greeting</a>
</@c.page>