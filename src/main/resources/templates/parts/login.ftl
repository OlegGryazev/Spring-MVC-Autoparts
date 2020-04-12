<#macro login path isRegisterForm>

    <form class="mt-5" action="${path}" method="post">
        <div class="form-group row">
            <label for="username" class="col-sm-2 col-form-label">User</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="username" name="username" placeholder="User Name" />
            </div>
        </div>
        <div class="form-group row">
            <label for="password" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" />
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label for="firstName" class="col-sm-2 col-form-label">Имя</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Иван" />
                </div>
            </div>
            <div class="form-group row">
                <label for="middleName" class="col-sm-2 col-form-label">Отчество</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="middleName" name="middleName" placeholder="Иванович" />
                </div>
            </div>
            <div class="form-group row">
                <label for="lastName" class="col-sm-2 col-form-label">Фамилия</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Иванов" />
                </div>
            </div>
            <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" id="email" name="email" placeholder="some@some.com" />
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <div class="col-sm-10">
                <#if !isRegisterForm>
                    <a href="/registration">Register new user</a>
                </#if>
                <button type="submit" class="btn btn-primary"><#if !isRegisterForm>
                        Sign In
                    <#else>
                        Registration
                    </#if>

                </button>
            </div>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Sign Out"/>
    </form>
</#macro>
