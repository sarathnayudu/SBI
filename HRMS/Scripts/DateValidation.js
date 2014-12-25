// JScript File


// Declaring valid date character, minimum year and maximum year
var dtCh= "/";
var minYear=1900;
var maxYear=2500;

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please Enter Valid Month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please Enter Valid Day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please Enter Valid 4 Digit Year Between "+minYear+" And "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please Enter Valid Date")
		return false
	}
return true
}

function ValidateDate(val){
	var dt=document.getElementById(val);
	
if(dt.value!="")
{
   if (isDate(dt.value)==false){
		dt.focus()
		return false
	}
	
    return true
 }
 }
 

function getdays(val)
{
var fromDate=document.getElementById(val).value;
var today=new Date();
var toDate=today.getMonth()+1+"/"+today.getDate()+"/"+today.getFullYear();


var fDate = fromDate.split("/");

var fDate1 = new Date(fDate[2],fDate[0] , fDate[1]-1); //yyyy/mm/dd

var tDate = toDate.split("/");
var tDate1 = new Date(tDate[2], tDate[0] ,tDate[1]-1); //yyyy/mm/dd

if(fDate1>tDate1)
{    
    alert('Date cannot be > Todays Date');    
}
}

function getdays1(val, val1) {
    
    var fromDate = document.getElementById(val1).value;
    var toDate = document.getElementById(val).value;    
    var fDate = fromDate.split("/")
    var fDate1 = new Date(fDate[2], fDate[0], fDate[1] - 1); //yyyy/mm/dd
    var tDate = toDate.split("/");
    var tDate1 = new Date(tDate[2], tDate[0], tDate[1] - 1); //yyyy/mm/dd

//    alert(fDate1.toDateString());
//    alert(tDate1.toDateString());
    if (fDate1 > tDate1) {
        alert('Hired Date cannot be > Termination Date');
    }
}


var dat = new Date();
var curday = dat.getDate();
var curmon = dat.getMonth()+1;
var curyear = dat.getFullYear();
function checkleapyear(datea)
{
	if(datea.getYear()%4 == 0)
	{
		if(datea.getYear()% 10 != 0)
		{
			return true;
		}
		else
		{
			if(datea.getYear()% 400 == 0)
				return true;
			else
				return false;
		}
	}
  return false;
}
function DaysInMonth(Y, M) {
    with (new Date(Y, M, 1, 12)) {
        setDate(0);
        return getDate();
    }
}
function datediff(date1, date2) {
    var y1 = date1.getFullYear(), m1 = date1.getMonth(), d1 = date1.getDate(),
	 y2 = date2.getFullYear(), m2 = date2.getMonth(), d2 = date2.getDate();
    if (d1 < d2) {
        m1--;
        d1 += DaysInMonth(y2, m2);
    }
    if (m1 < m2) {
        y1--;
        m1 += 12;
    }
    return [y1 - y2, m1 - m2, d1 - d2];
}
