<#import "parts/common.ftl" as c>
<@c.page>
    List of users <a href="/main">Back to main</a>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list user.roles as role>${role}<#sep>, </#list></td>
            <td><a href="/user/${user.id}">edit</a></td>
            <td>
                <form action="/carList" method="get" >
                    <input type="hidden" name="username" value="${user.username}"/>
                    <button type="submit">Edit cars</button>
                </form>
            </td>
        </tr>
        </#list>
        </tbody>
    </table>
</@c.page>