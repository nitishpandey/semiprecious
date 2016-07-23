
function numbersOnly(fieldData)
{
fieldData.value = fieldData.value.replace(/[^0-9]/g, '');
}


function numbersPeriodOnly(fieldData)
{
fieldData.value = fieldData.value.replace(/[^0-9.]/g, '');
}

function pop_set_cred_window() { 

window.open('pop_set_authnet_credentials.php','','width=550,height=300,location=no,scrollbars=no,menubars=no,toolbars=no');

} 

function  copyAddress() { 

if(document.form1.sInfo.checked == true ) { 
document.form1.shipping_company.value = document.form1.billing_company.value ; 
document.form1.shipping_firstName.value = document.form1.billing_firstName.value ; 
document.form1.shipping_lastName.value = document.form1.billing_lastName.value ; 
document.form1.shipping_address.value = document.form1.billing_address.value ; 
document.form1.shipping_city.value = document.form1.billing_city.value ; 
document.form1.shipping_state.value = document.form1.billing_state.value ;
document.form1.shipping_zip.value = document.form1.billing_zip.value ; 
document.form1.shipping_country.value = document.form1.billing_country.value ; 

} 



}


function scValidator(formName) { 

//define variables
var formField; 
var message=''; 


//loop through form elements
for(i=0;i<formName.elements.length;i++) { 


formField = formName.elements[i]; 



switch(formName.elements[i].type) {

//text field
case "text": 


//if empty
if(formField.value == '') { 
//and id="required"
if(formField.id == 'required') { 
//check to see if message object exists
if(formField.lang) { message= message + '\r\n' + formField.lang ; }
//display field name if message object doesn't exists
else { message= message + '\r\n' + formField.name + ' Required'; }

   
}

}
  
break; 



//select menu 
case "select-one":
case "select-multiple":


//if empty
if(formField.value == '') { 
//and id="required"
if(formField.id == 'required') { 
//check to see if message object exists
if(formField.lang) { message= message + '\r\n' + formField.lang ; }
//display field name if message object doesn't exists
else { message= message + '\r\n' + formField.name + ' Required'; }

   
  }

}




break; 

//radio button 
case "radio": 


var radioField = formField; 

//if checked
if(formField.checked == true)  { var radioCheck=true;  }

if(formField.id == 'required') { 


var radioMessage; 
var radioRequired=true; 

if(formField.lang) { radioMessage = radioField.lang ; } else { radioMessage= formField.name + ' Required'; }



} 





 





break; 

//check box 
case "checkbox": 

//if empty
if(formField.checked == false) { 
//and id="required"
if(formField.id == 'required') { 
//check to see if message object exists
if(formField.lang) { message= message + '\r\n' + formField.lang ; }
//display field name if message object doesn't exists
else { message= message + '\r\n' + formField.name + ' Required'; }

   
  }

}



break; 



}





 }





//radio button check addition 
if(radioCheck != true && radioRequired == true) { 

message = message + '\r\n' + radioMessage; 

}


//display generic button 
if(message != '') { alert(message); return false; } else { return true; } 








}