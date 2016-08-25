# Share Login Announcements

This add-on makes it possible to publish announcements on the Share login page.

# How it works

Deploying this add-on will automatically create a folder called "Announcements" in the Data Dictionary. Create one plain text file in that folder for each announcement. The content of the document is used as the text of the announcement.

To hide an announcement, either delete it or move it to another folder. Any folders you create under Announcements will be ignored, so you can keep an "Archive" folder under "Announcements", for example. Only announcements in the root Announcements folder will be returned.

# Configuration

At the present time, the bootstrapped folder does not grant "Guest" consumer access to the Announcements folder, so you'll have to do that manually, otherwise the announcements won't be returned to unauthenticated users.

# REST API

The add-on creates a new rest endpoint called `/alfresco/s/metaversant/announcements` which supports GET and returns an array of announcement objects. Each announcement object looks like:

    {
      {
        id: "workspace://SpacesStore/5bcb3581-54d8-40da-b958-3399989f2d80",
        name: "fancy-announcement.txt",
        content: "This%20announcement%20includes%20%3Cb%3Esome%20markup%3C/b%3E%20so%20it%20is%20considered%20to%20be%20a%20fancy%20announcement."
      }
    }

Notice that the content property is escaped. This allows things like embedded quotes and so on which would otherwise cause problems for the JSON parser.

# Front-End

TBD    
