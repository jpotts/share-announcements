function main() {
  var resp = remote.call("/metaversant/announcements");
  if (resp.status == 200) {
    var obj = JSON.parse(resp.text);
    model.announcements = obj;
  }

  // Widget instantiation metadata...
  var dashletResizer = {
    id : "DashletResizer",
    name : "Alfresco.widget.DashletResizer",
    initArgs : ["\"" + args.htmlid + "\"","\"" + instance.object.id + "\""],
    useMessages: false
  };
  model.widgets = [dashletResizer];
}

main();
