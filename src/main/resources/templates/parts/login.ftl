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
      <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </div>
  </div>
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
