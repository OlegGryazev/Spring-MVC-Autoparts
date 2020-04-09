<#macro login path>
//    <form action="${path}" method="post">
//        <div><label> User Name : <input type="text" name="username"/> </label></div>
//        <div><label> Password: <input type="password" name="password"/> </label></div>
//        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
//        <div><input type="submit" value="Sign In"/></div>
//    </form>

<form action="${path}" method="post">
  <div class="form-group row">
    <label for="username" class="col-sm-2 col-form-label">User</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="username" name="username" placeholder="User Name">
    </div>
  </div>
  <div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="password" name="username" placeholder="Password">
      <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">Sign in</button>
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
