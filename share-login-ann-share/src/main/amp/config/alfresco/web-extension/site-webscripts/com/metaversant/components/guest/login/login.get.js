var resp = remote.call("/metaversant/announcements?guest=true");
if (resp.status == 200) {
  var obj = JSON.parse(resp.text);
  model.announcements = obj;
} else {
  model.announcements = [
    {
      "content": "Response code fetching announcements was " + resp.status
    }
  ]
}
