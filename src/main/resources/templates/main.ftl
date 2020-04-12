<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <div class="container-fluid">
        <div class="row">

            <div class="col-sm input-group mb-3">
                <form method="post" action="add" enctype="multipart/form-data">
                    <input class="form-control mb-2" type="text" name="article" placeholder="Введите артикул" />
                    <input class="form-control mb-2" type="text" name="manufacturer" placeholder="Введите производителя" />
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" name="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                            <label class="custom-file-label" for="inputGroupFile01">Обзор...</label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="btn btn-primary" type="submit">Добавить</button>
                </form>
            </div>

            <div class="col-sm">
                <button class="btn btn-secondary float-right" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    Some filters...
                </button>

                <div class="collapse adaptive-box" id="collapseExample">
                    <div class="card card-body">
                        <div>
                            <b>Filter:</b>
                            <form method="get" action="/main">
                                <input class="form-control mb-2" type="text" name="filterArticle" value = "${filterArticle!}" placeholder="Артикул"/>
                                <input class="form-control mb-2" type="text" name="filterManufacturer" value = "${filterManufacturer!}" placeholder="Производитель"/>
                                <button class="btn btn-secondary" type="submit">Найти</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Артикул</th>
            <th scope="col">Производитель</th>
            <th scope="col">Добавлено</th>
            <th scope="col">Фото</th>
        </tr>
        </thead>
        <tbody>
        <#list parts as part>
            <tr>
                <th scope="row">
                    <div>
                        <form method="get" action="del" style="display: inline-block">
                            <input type="hidden" name="partid" value="${part.id}" />
                            <button class="btn btn-default" type="submit"><img style="width:16pt; height: 16pt" src="/img/trash-outline.svg"></button>
                        </form>
                        ${part.article}
                    </div>
                </th>
                <td>${part.manufacturer}</td>
                <td>${part.authorName}</td>
                <td>
                    <#if part.filename??>
                        <img src="/img/${part.filename}">
                    </#if>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>