<#escape x as jsonUtils.encodeJSONString(x)>
[
  <#list announcements as ann>
    {
      "id": "${ann.id}",
      "name": "${ann.name}",
      "content": "${ann.content}"
    }<#if ann_has_next>,</#if>
  </#list>
]
</#escape>
