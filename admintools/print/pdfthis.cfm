<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PDF Generation Test</title>
</head>

<cfparam name=lastitem default=1>

<body>
<cfhttp url="http://www.semiprecious.com/admintools/vijayprintable.cfm?lastitem=#lastitem#"></cfhttp>

<cfdocument format="pdf" pagetype="a4" margintop="0.1">
    <cfoutput>
        #cfhttp.FileContent#
    </cfoutput>
</cfdocument>

</body>
</html>