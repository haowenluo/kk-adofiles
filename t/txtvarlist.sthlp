{smcl}
{* $Id$ }
{* $Date$}{...}
{cmd:help txtvarlist}
{hline}

{title:Title}

{p2colset 5 18 20 2}{...}
{p2col:{hi:txtvarlist }{hline 2}}Shorthand to export a varlist to a text file.{p_end}
{p2colreset}{...}

{title:Syntax}

{p 8 16 2}
{cmdab:txtvarlist} [{help varlist}] [{cmdab:using} {it:filename}]   [, options]

	
{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:File location}
{synopt :{opt rep:lace}}allows overwriting an existing {it:filename}.{p_end}
{synopt :{opt noa:ppend}}specifies that output is {bf:not} appended to {it:filename} when the file already exists.{p_end}
{synopt :{opt h:andle(handle)}*}Specify the name of a {help file} handle, to which the output will be added.{p_end}

{syntab:Text before/after/between each variable}
{synopt:{opt parse(string)}}Specify a parsing character. Default is {opt parse}(" ").{p_end}
{synopt:{opt varp:refix(string)}}Additional text before each variable.{p_end}
{synopt:{opt vars:uffix(string)}}Additional text after each variable.{p_end}

{syntab:Text before/after {it:varlist}}
{synopt:{opt p:refix(string)}}Additional text before {it:varlist} is written.{p_end}
{synopt:{opt s:uffix(string)}}Additional text after {it:varlist} is written.{p_end}

{syntab:Macro directives**}
{synopt :{opt g:lobal(global_name)}}Directive line in {it:filename} to create a global named {it:global_name} with contents of {it:varlist}.{p_end}
{synopt :{opt l:ocal(local_name)}}Directive line in {it:filename} to create a local named {it:local_name} with contents of {it:varlist}.{p_end}
{synoptline}
{pstd}*  Note that one must specify the {help using} qualifier or the {opt handle} option, but not both.{p_end}
{pstd}** If the {opt global} and/or {opt local} option is called, only these directives are written to {it:filename}. {p_end}
{p2colreset}{...}


{title:Description}

{pstd}{cmd:txtvarlist} exports a variable list to a text file.  It is that simple.  There are a
few options to enhance the output and control how the file is saved, but it's really not too
much more complicated than that.  


{title:Options}

{dlgtab:File location}

{phang}You can specify a filename to 
save the content to with {opt using} {it:filename}.  By default, the text is appended 
to the file in the case that the file already exists. This behavior can be 
overridden with {opt replace} or {opt noappend}.

{phang}If a file handle has already been called with {help file open}, you can specify a 
file {it:handle} instead of a filename.

{dlgtab:Text before, after, or between each variable}

{phang}By default, the variables in {help varlist} are separated by spaces.  

{phang} The {opt parse} option can be used to separate the variables with something else,
for example {opt parse}(", ").  To put each variable on its own line, use {opt parse}(_n)

{phang}The {opt varprefix} and {opt varsuffix} options will add text to the 
beginning or end of {it each} variable name.  For example, the command 
{break}{space 1}{break}
{cmd:. txtvarlist myvar ...  , varsuffix("_rounded")} 
{break}{space 1}{break}
would substitute "myvar_rounded" in lieu of "myvar" {p_end}

{dlgtab:Text before or after the varlist}

{phang}You can use the {opt prefix} and {opt suffix} options to include 
additional text before/after the {it:varlist} is written.  The contents of
these options can be text strings (with quotes), directives for {help file write}, 
or both.  

{phang}For example you could declare 
{break}{space 1}{break}
{cmd:. txtvarlist myvar ...  , prefix("My title line 1" _n "My title line 2" _n)} 

{phang}To add a time-stamp, try 
{break}{space 1}{break}
{cmd:. txtvarlist myvar ...  , suffix(_n "$S_DATE $S_TIME")} 

{dlgtab:Macro directives}

{phang}This command can also be used to create a file containing macro "directives" 
via the {opt global} and/or {opt local} options.
By this, I mean one-line commands that direct Stata to create a {help macro} with the 
variable names in the macro's contents.  For example, after the command 
{break}{space 1}{break}
{cmd:. txtvarlist myvar1 myvar2 using filename.txt , global(myglobal)} 
{break}{space 1}{break}
the following line would be written to {it:filename.txt}: 
{break}{space 1}{break}
{cmd: global myglobal myvar1 myvar2}

{phang}The program does {bf:not} run the "directive," 
but it does provide links to run the file. {opt global} and/or {opt local} options can be used together, but not with 
{opt prefix} or {opt suffix}.  


{title:Example}

{pstd}I often use this command when I want to transfer a list of variables from 
one .do program to another .do program.

{pstd}For example, I may have one program that "cleans" my data set: {p_end}
{phang}{cmd:. use dirtydata.dta }{p_end}
{phang}{space 2}... {p_end}
{phang}{cmd:. txtvarlist var1 var2 var3 using "my_special_vars.do" , global(lhs_vars)}{p_end}
{phang}{cmd:. txtvarlist var4 var5 var6 using "my_special_vars.do" , global(lhs_vars_alt)}{p_end}
{phang}{cmd:. save cleandata.dta }{p_end}

{pstd}Then, a month later, I could write a separate program that simply includes 
the text file and then uses the original macros.{p_end}
{phang}{cmd:. use cleandata.dta}{p_end}
{phang}{cmd:. include "my_special_vars.do"}{p_end}
{phang}{cmd:. regress var0 $lhs_vars}{p_end}
{phang}{cmd:. regress var0 $lhs_vars_alt}{p_end}


{title:Other Information}
{* $Id$ }
{phang}Author: Keith Kranker{p_end}

{phang}$Date${p_end}

{title:Also see}

{psee}
Help:  
{help varlist}, {help macro}, {help file}, {help do}, {help include}{p_end}

