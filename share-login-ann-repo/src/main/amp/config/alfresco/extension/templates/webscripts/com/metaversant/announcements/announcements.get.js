function main() {
  var sortByModified = {
    column: "@{http://www.alfresco.org/model/content/1.0}modified",
    ascending: false
  };

  var sortByCreated = {
    column: "@{http://www.alfresco.org/model/content/1.0}created",
    ascending: false
  };

  var paging = {
    maxItems: 10,
    skipCount: 0
  };

  var queryDef = {
    query: "PATH:\"/app:company_home/app:dictionary/app:announcements/*\"",
    store: "workspace://SpacesStore",
    language: "fts-alfresco",
    sort: [sortByModified, sortByCreated],
    page: paging
  };

  var results = search.query(queryDef);
  var anns = [];
  for (var i = 0; i < results.length; i++) {
    if (results[i].mimetype != "text/plain") {
      continue;
    }
    anns.push({
      id: results[i].nodeRef.toString(),
      name: results[i].name,
      content: results[i].content
    });
  }
  model.announcements = anns;
}

main();
