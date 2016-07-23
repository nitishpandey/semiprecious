The datasource name is 'semiprecious'.

There are two tables in it.
 One is the othersites , this one contains details about the site.

Second is the acceptance table.
This table has one column to indicate password   for enabling updating
operations.

A second column indicates mode of showing the links to a visitor.

There are 2 modes. 0 => Approval from you not required, in other words all links in the table othersites are shown (not all really).
  1=> Approval reqd from you. Thus only sites which have been approved are shown in the listing for visitors.

 
It follows , that there is a status (accept) column in the othersites table. THis has 3  (not 2 ) values. 1 => accepted (approved), 0 => not yet /not approved. and finally -1 => deleted (though not irreversible, will not show up in hte listing in any of the 2 possible modes discussed above).

to get your semiprecious look to the pages, just modify or replace the file 'header.cfm'.

The update page will help you move links between status of approved, yet to be approved and deleted. 

Enjoy. 
You can review the links by starting off at the file indexnew.htm