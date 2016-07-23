# initiate authentication w/ gmail
  #
  # create url with url-encoded params to initiate connection with contacts api
  #
  # next - The URL of the page that Google should redirect the user to after authentication.
  # scope - Indicates that the application is requesting a token to access contacts feeds. 
  # secure - Indicates whether the client is requesting a secure token.
  # session - Indicates whether the token returned can be exchanged for a multi-use (session) token.
  #  
<cfif isdefined("url.token")>
<cfdump var="#url#">
<cfset token = 'AuthSub token="#url.token#"'/>
<cfelse>
<cfscript>
  next_param = "https%3A%2F%2Fwww.semiprecious.com%2Fincludes%2Fgoogle_contacts.cfm" ;
  scope_param = "http%3A%2F%2Fwww.google.com%2Fm8%2Ffeeds%2F";
  secure_param = "1";
  session_param = "1";
  root_url = "https://www.google.com/accounts/AuthSubRequest";
  query_string = "?scope=#scope_param#&session=#session_param#&secure=#secure_param#&next=#next_param#";
  cflocation(root_url & query_string) ;
  </cfscript>
</cfif>
  token = params[:token] # received the single-use authsub token, exchange for authsub session token
<cfhttp url="https://www.google.com/accounts/AuthSubSessionToken" port="443" >
<cfhttpparam type="header" name="Authorization"  value='#token#'   >
</cfhttp> <cfoutput>#token#</cfoutput>
<cfdump var="#cfhttp#"><!--   
headers = {'Authorization' => "AuthSubtoken="#{token}""}
  resp, data = http.get(path, headers)
 
  if resp.code == "200" 
    token = ''
    data.split.each do |str|
      if not (str =~ /Token=/).nil?
        token = str.gsub(/Token=/, '')   
      end
    end
    redirect_to "http://www.example.com/?token=#{token}"
  else  
    redirect_to "http://www.example.com/"
  end
  
  # GET http://www.google.com/m8/feeds/contacts/default/base
require 'net/http'
require 'rexml/document'      
 
http = Net::HTTP.new('www.google.com', 80)
# by default Google returns 50? contacts at a time.  Set max-results to very high number
# in order to retrieve more contacts
path = "/m8/feeds/contacts/default/base?max-results=10000"
headers = {'Authorization' => "AuthSubtoken="#{authsub_token}""}
resp, data = http.get(path, headers)
 
# extract the name and email address from the response data
xml = REXML::Document.new(data)
contacts = []
xml.elements.each('//entry') do |entry|
  person = {}
  person['name'] = entry.elements['title'].text
 
  gd_email = entry.elements['gd:email']
  person['email'] = gd_email.attributes['address'] if gd_email
 
  contacts << person
end#
 -->