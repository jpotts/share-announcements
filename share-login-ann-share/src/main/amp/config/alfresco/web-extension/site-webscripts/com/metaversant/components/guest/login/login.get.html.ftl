<@markup id="announcements-css" target="css" action="after" scope="global">
   <@link href="${url.context}/res/metaversant/css/announcements.css" />
</@>

<@markup id="change-password-link" target="form" action="before" scope="global" >
  <#if announcements?? && announcements?size gt 0>
    <div id="announcements">
      <p>${msg("header.announcements")}:</p>
      <ul>
        <#list announcements as ann>
          <li class="announcement">${ann.content}</li>
        </#list>
      </ul>
    </div>
  </#if>
</@>
