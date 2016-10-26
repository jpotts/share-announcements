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
        content: "This is a test \"announcement\" number 1."
      }
    }

Notice that the content property is escaped. This allows things like embedded quotes and so on which would otherwise cause problems for the JSON parser.

## Front-End

The front-end is implemented using a Share module extension. The extension hooks into the Alfresco guest login component (which is how the login page is rendered) and injects new markup.

The markup formats the announcements as an unordered list. The markup is produced using freemarker which can be found in a file called login.get.html.ftl. The data being styled is retrieved by the login.get.js controller which makes the remote call to the announcements endpoint described earlier.

The injected markup also adds a new CSS resource, announcements.css. It contains a couple of simple classes that format the announcements list.     

## Maven
Add the dependencies and overlays to the POM files of your WAR projects.

For the repository tier, in a project created with the all-in-one archetype, edit repo/pom.xml:


    <dependencies>
      ...
      <dependency>
          <groupId>com.metaversant</groupId>
          <artifactId>share-login-ann-repo</artifactId>
          <version>0.0.2</version>
          <type>amp</type>
      </dependency>
      ...
    </dependencies>

    <overlays>
      ...
      <overlay>
          <groupId>com.metaversant</groupId>
          <artifactId>share-login-ann-repo</artifactId>
          <type>amp</type>
      </overlay>
      ...
    </overlays>

For the Share tier, in a project created with the all-in-one archetype, edit share/pom.xml:

    <dependencies>
      ...
      <dependency>
          <groupId>com.metaversant</groupId>
          <artifactId>share-login-ann-share</artifactId>
          <version>0.0.2</version>
          <type>amp</type>
      </dependency>
      ...
    </dependencies>

    <overlays>
      ...
      <overlay>
          <groupId>com.metaversant</groupId>
          <artifactId>share-login-ann-share</artifactId>
          <type>amp</type>
      </overlay>
      ...
    </overlays>

## Testing Locally

There are two projects in the repository, one is for the repo tier AMP and the other is for the Share tier AMP.

You can run each one by doing "mvn integration-test -Pamp-to-war". What you'll end up with is Alfresco running on 8080 and Share running on 8081.

You can then hit http://localhost:8080/alfresco/s/metaversant/announcements?guest=true to get a list of announcements, which will be an empty array initially.

You can then log in to Alfresco (http://localhost:8081/share) and add some announcements to the Announcements folder in Data Dictionary. You'll also need to add the "Guest" user as a Consumer on the Announcements folder.

After that if you hit the end point again you'll see a JSON array of announcement objects.
