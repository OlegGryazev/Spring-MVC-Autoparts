<#include "security.ftl">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Parts</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Parts</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">User list</a>
            </li>
            </#if>
        </ul>
        <div class="navbar-text mr-3">${name}</div>
        <#if name != "unknown">
            <form class="form-inline my-2 my-lg-0" action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Sign Out"/>
            </form>
        </#if>
    </div>
</nav>