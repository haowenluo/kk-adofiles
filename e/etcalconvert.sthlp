{smcl}
{* $Id$ }
{* $Date$}{...}
{cmd:help etcalconvert}
{hline}

{title:Ethiopian year/month calendar conversion}

{pstd}
Convert a year/month in the Ethiopian calendar to the (approximately) equivalent Gregorian calendar month/year.


{title:Syntax}

{p 8 17 2}
{cmdab:etcalconvert}
{it: year_var month_var}
{ifin}
{cmd:,} ( {it:replace} | {it:generate( new_year_var new_month_var )} )

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt r:eplace}}replace the year/month  input variables w/ Gregorian calendar year/month{p_end}
{synopt:{opt gen:erate()}}create new year/month variable names for Gregorian calendar year/month{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}
Specifiy {cmd:replace} or {cmd:generate}, but not both.{p_end}


{title:Description}

{pstd}
{cmd:etcalconvert} converts a year/month in the Ethiopian calendar to the Gregorian calendar month/year.

{pstd}This is only an approximation of a more complicated calendar conversion process.  
It shifts year/month by 7 years, 8 months.
See {browse "http://ethiopic.org/Calendars/"} 
or {browse "http://en.wikipedia.org/wiki/Ethiopian_calendar"} for details.



{title:Other Information}
{* $Id$ }
{phang}Author: Keith Kranker{p_end}

{phang}$Date${p_end}


{title:Examples}

{pstd}I created for stacking DHS data files from multiple countries. Ethiopia DHS survey data was
not in standard calendar format. 

{cmd:. etcalconvert v007 v006 if file_country_code=="ET", replace }
{cmd:. etcalconvert b2 b1     if file_country_code=="ET", replace }
{cmd:. etcalconvert h9y h9m   if file_country_code=="ET", replace}

{title:Also see}

{psee}
Online: {help dates}
{p_end}

