{smcl}
{* $Id$ }
{* $Date$}{...}
{cmd:help usedrop}
{hline}

{title:Title}

{p2colset 5 18 20 2}{...}
{p2col:{hi:usedrop }{hline 2}} Use Stata dataset, excluding selected variables.{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 17 2}
{cmdab:usedrop} {varlist} {help using} {it:filename}
[, clear nolabel if() in()] 


{title:Description}

{pstd}{cmd:usedrop} is used to load a subset of a dataset.   
It is identical to {help using}, except that {help varlist}
is {ul:excluded} from the dataset instead of included in the dataset 
you load into memory.

{pstd}The program does the following: {break}
{space 4} 1 - Loads the first line of the dataset{break}
{space 4} 2 - Creates a list of all the variables except those in {it:varlist}{break}
{space 4} 3 - Loads these remaining variables dataset into memory.

{pstd}The advantage of this command over {break} 
{space 4}. use {ifin} using {it:filename} {break} 
{space 4}. drop {it:varlist} {break} 
is that you don't every load all the variables into memory before dropping them.  
This is handy when the dataset is larger than your computer's 
operating system can handle.


{title:Options}

{pstd}Options are the same as the 	{help use} command.

{pstd}{opt if()} and {opt in()} should be declared as if they are strings. They will be inserted into the {help use} command in the proper place.{break}


{title:Example}

{pstd}. usedrop var1 var2 var3 using "c:\\myfolder\myfile.dta", clear if("if var4==1") in("in 1/200")


{title:Other Information}
{* $Id$ }
{phang}Author: Keith Kranker{p_end}

{phang}$Date${p_end}


{title:Also see}

{psee}
Online:  
{help use}
{p_end}
