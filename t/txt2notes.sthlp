{smcl}
{* $Id$ }
{* $Date$}{...}
{cmd:help txt2notes}
{hline}

{title:Title}

{p2colset 5 18 20 2}{...}
{p2col:{hi:txt2notes }{hline 2}}Read a "readme" text file and add to your _dta notes.{p_end}
{p2colreset}{...}

{title:Syntax}

{p 8 16 2}
{cmdab:txt2notes} [varname] {help using} {it: filename}


{title:Description}

{pstd}{cmd:txt2notes} opens a text file.  Each line in the text file (that is not empty)
is then added to the database as a {help notes:note}.

If a variable name is included, the readme file will be attached to that variable, 
instead of the dataset.  (See {help notes:note} for more information.)

{pstd}Use with caution: there is no built-in validation or other checks
to make sure your file should be used in this manner.  


{title:Options}

{phang}There are no options for this command.


{title:Example}

{phang}{cmd:. insheet using myfile.raw }{p_end}
{phang}{cmd:. txt2notes using README.txt}{p_end}

{pstd}Then, when you type{p_end}
{phang}{cmd:. notes list}{p_end}

{pstd}you will see that all the contents of the file README.txt 
were added as notes for your file.{p_end}


{title:Other Information}
{* $Id$ }
{phang}Author: Keith Kranker{p_end}

{phang}$Date${p_end}


{title:Also see}

{pstd}
Help:  
{help notes}, {help using}, {help file}{p_end}

