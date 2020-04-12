<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <table class="table table-hover table-sm">
        <thead>
        <tr>
            <th>Марка</th>
            <th>Модель</th>
            <th>VIN</th>
            <th>Доп. инфо</th>
        </tr>
        </thead>
        <tbody>
        <#list cars as car>
            <tr>
                <#if isAdmin>
                    <td>
                        <form method="get" action="carList/del" style="display: inline-block">
                            <input type="hidden" name="carid" value="${car.id}" />
                            <button class="btn btn-default" type="submit"><img style="width:16pt; height: 16pt" src="/img/trash-outline.svg"></button>
                        </form>
                    </td>
                </#if>
                <td>${car.getMark()}</td>
                <td>${car.getModel()}</td>
                <td>${car.getVin()}</td>
                <td>${car.getNotes()}</td>
            </tr>
        </#list>
        </tbody>
    </table>

    <button class="btn btn-primary btn-circle mb-3" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">+</button>

    <div class="collapse container-fluid" id="collapseExample">
        <div class="card card-body">
            <form method="post" action="carList/add">
            <div class="row">
                <div class="col-sm">
                    <input class="form-control mb-2" type="text" name="mark" placeholder="Марка" />
                </div>
                <div class="col-sm">
                    <input class="form-control mb-2" type="text" name="model" placeholder="Модель" />
                </div>
                <div class="col-sm">
                    <input class="form-control mb-2" type="text" name="vin" placeholder="VIN" />
                </div>
                <div class="col-sm">
                    <input class="form-control mb-2" type="text" name="notes" placeholder="Доп инфо" />
                </div>
            </div>
                <input type="hidden" value="${_csrf.token}" name="_csrf" />
                <button class="btn btn-secondary" type="submit">Добавить</button>
            </form>

        </div>
    </div>
</@c.page>
