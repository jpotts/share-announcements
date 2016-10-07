<@markup id="css" >
   <#-- No CSS Dependencies -->
</@>

<@markup id="js">
   <#-- No JavaScript Dependencies -->
</@>

<@markup id="widgets">
   <@createWidgets group="dashlets"/>
</@>

<@markup id="html">
   <@uniqueIdDiv>
      <div class="dashlet announcements">
         <div class="title">${msg("header.announcements")}</div>
         <div class="body scrollableList" <#if args.height??>style="height: ${args.height?html}px;"</#if>>
         <#if announcements?? && announcements?size gt 0>
            <#list announcements as ann>
            <div class="detail-list-item <#if ann_index = 0>first-item<#elseif !ann_has_next>last-item</#if>">
               <div>
                  <div class="announcement">
                      ${ann.content}
                  </div>
               </div>
            </div>
            </#list>
         <#else>
            <div class="detail-list-item first-item last-item">
               <span>${msg("label.noAnnouncements")}</span>
            </div>
         </#if>
        </div>
    </div>
  </@>
</@>
