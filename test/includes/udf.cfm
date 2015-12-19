<cfinclude template="udf0.cfm" />
<cfscript>
function _getCurrentTemplatePath() {
    return getPageContext().getPage().getCurrentTemplatePath();
}
	function titleCase(string)  {
string =rtrim(string);	
if (len(string) gt 1)
	{
		string = lcase(string);

		if (refind("^[a-z]", string))  {
		string = ucase(left(string, 1)) & right(string,
(len(string) - 1 ));
		}
		next = refind("[[:space:][:punct:]][a-z]", string);
		while (next)  {
			if (next lt (len(string) - 1)) {
			string = left(string, (next)) & ucase(mid(string,
next+1, 1)) &  right(string, (len(string) - (next + 1)));
			} else {
			string = left(string, (next)) &
ucase(right(string, 1));
			}
		next = refind("[[:space:][:punct:]][a-z]", string, next);
		}
	} else {
	string = ucase(string);
	}
/* post fixes */
/* Recall that "Replace()" is case sensitive */
string = Replace(string," Of "," of ","ALL");
string = Replace(string," And "," and ","ALL");
string = Replace(string,"'S ","'s ","ALL");
string = Replace(string," At "," at ","ALL");
string = Replace(string," The "," the ","ALL");
string = Replace(string," For "," for ","ALL");
string = Replace(string," De "," de ","ALL");
string = Replace(string," Y "," y ","ALL");
string = Replace(string," In "," in ","ALL");
return string;
}

/*
 * function - titleCase()
 * accepts and returns string data
 * this function is similar to LCase or UCase,
 * it was designed for the college database which was provided
 * in ALLCAPS.
 * questions? http://artlung.com/feedback/
 * 2003/04/22
*/
function value_convert(pp) {
return pp;
}
function format(pp)
{

 return dollarformat(replace(pp,",",""));
}
	function round_format(pp)
{
kilo = format(pp);
dot = find('.',kilo) ;
if (dot){
kilo = left(kilo, dot -1);
}
return kilo;
}

function rate_format(pp) {
return dollarformat(pp);
}
function soldformat(pp)
{
 return dollarformat(ceiling(1.1*pp));
}
function wmddiscount(pp)
{

 disc  =  decimalformat(35 *( pp/350)) ;
if (disc LT 10)
 disc = 10 ;
else if (disc GT 35 )
 disc = 35 ;
 

return disc;
}
</cfscript>