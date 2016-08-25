# Share Login Announcements

This add-on makes it possible to publish announcements on the Share login page.

## How it works

Deploying this add-on will automatically create a folder called "Announcements" in the Data Dictionary. Create one plain text file in that folder for each announcement. The content of the document is used as the text of the announcement.

To hide an announcement, either delete it or move it to another folder. Any folders you create under Announcements will be ignored, so you can keep an "Archive" folder under "Announcements", for example. Only announcements in the root Announcements folder will be returned.

## Configuration

At the present time, the bootstrapped folder does not grant "Guest" consumer access to the Announcements folder, so you'll have to do that manually, otherwise the announcements won't be returned to unauthenticated users.

## REST API

The add-on creates a new rest endpoint called `/alfresco/s/metaversant/announcements` which supports GET and returns an array of announcement objects. Each announcement object looks like:

    {
      {
        id: "workspace://SpacesStore/5bcb3581-54d8-40da-b958-3399989f2d80",
        name: "fancy-announcement.txt",
        content: "This%20announcement%20includes%20%3Cb%3Esome%20markup%3C/b%3E%20so%20it%20is%20considered%20to%20be%20a%20fancy%20announcement."
      }
    }

Notice that the content property is escaped. This allows things like embedded quotes and so on which would otherwise cause problems for the JSON parser.

## Front-End

TBD    

## Testing Locally

There are two projects in the repository, one is for the repo tier AMP and the other is for the Share tier AMP.

You can run each one by doing "mvn integration-test -Pamp-to-war". What you'll end up with is Alfresco running on 8080 and Share running on 8081.

You can then hit http://localhost:8080/alfresco/s/metaversant/announcements?guest=true to get a list of announcements, which will be an empty array initially.

You can then log in to Alfresco (http://localhost:8081/share) and add some announcements to the Announcements folder in Data Dictionary. You'll also need to add the "Guest" user as a Consumer on the Announcements folder.

After that if you hit the end point again you'll see a JSON array of announcement objects.
