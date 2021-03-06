{smcl}
{* $Id$ }
{* $Date$}{...}
{cmd:help scatter_hist} 
{hline}

{title:Title}

{p2colset 5 22 26 2}{...}
{p2col :{cmd:scatter_hist} {hline 2}}Scatter plot with bordering histograms{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 17 2}
{cmd:scatter_hist}
{it:y_variable x_variable} {ifin}
[{cmd:,}
{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Combined Plot}
{synopt:{opt d:etail}}display additional statistics{p_end}
{synopt:{opt iscale([*]#)}}size of text and markers{p_end}
{synopt:{opt altshrink}}alternate scaling of text, etc.{p_end}
{synopt:{opt {help title_options}}}titles to appear on combined graph{p_end}
{synopt:{opt {help region_options}}}outlining, shading, aspect ratio{p_end}
{synopt:{opt com:monscheme}}put graphs on common scheme{p_end}
{synopt:{opt sch:eme(schemename)}}overall look {p_end}
{synopt:{helpb nodraw_option:nodraw}}suppress display of combined graph{p_end}
{synopt:{helpb name_option:name()}}specify name for combined graph{p_end}
{synopt:{helpb saving_option:saving()}}save combined graph in file{p_end}

{syntab:Shared X- and Y- axes}
{synopt:{c -(}y|x{c )-}{helpb axis_scale_options:scale()}}log scales, range, appearance{p_end}
{synopt:{c -(}y|x{c )-}{helpb axis_label_options:label()}}major ticks plus labels{p_end}
{synopt:{c -(}y|x{c )-}{helpb axis_label_options:tick()}}major ticks only{p_end}
{synopt:{c -(}y|x{c )-}{helpb axis_label_options:mlabel()}}minor ticks plus labels{p_end}
{synopt:{c -(}y|x{c )-}{helpb axis_label_options:mtick()}}minor ticks only{p_end}
{synopt:{c -(}y|x{c )-}{helpb axis_title_options:title()}}specify axis title{p_end}

{syntab:Histogram}
{synopt:{cmd: {it: hist_method}}}the method used to draw histogram, where {it: hist_method} 
is one of {c -(}{bf:density|fraction|frequency|percent}{c )-}{p_end}
INCLUDE help gr_baropt

{syntab:Other twoway scatter options}
{synopt: *}Other options may (optionally) be declared.  These will be passed to the {helpb scatter} command. {p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}
{it: hmethod} may be one of .{p_end}


{title:Description}

{pstd}
{cmd:scatter_hist} Creates a graph that is a scatter plot for {it:y_variable} and {it:x_variable}.
Below the graph, is a histogram of {it:x_variable} and there is a histogram of {it:y_variable} to the right of the graph.

{pstd}This command automates the process outlined in the help file of {help graph combine} (see "Advanced use").


{title:Options}

{dlgtab:Combined Plot}

{phang}See {help graph combine} for option descriptions.  The options {it:imargin} and {it:graphregion} should not be declared.	

{dlgtab:Shared X- and Y- axes}

{phang} See {help axis options} for option descriptions.  The sub-options {it:nogrid} and {it:gmax} should not be declared as sub-options for {it:xlabel()}. The sub-options {it:alt} and {it:reverse} should not be declared as sub-options for {it:xlabel()} or {it:ylabel()}

{dlgtab:Histogram}

{phang}Select the method used to draw histogram.  Declare at most one of the following options:{break}
        {opt density} - draw as density; the default{break}
        {opt fraction} - draw as fractions{break}
        {opt frequency} - draw as frequencies{break}
        {opt percent} - draw as percents

{phang} See {help twoway histogram} for option descriptions.

{dlgtab:Other twoway scatter options}

{phang}Other options may (optionally) be declared.  
These will be passed to the {helpb scatter} command.  For example, you might declare
{help scatter##marker_options:marker_options}, 
{help scatter##marker_label_options:marker_label_options}, or 
{help scatter##jitter_options:jitter_options}.  

{phang}See {help twoway scatter} for a complete list of options.

{phang}These options are not restricted by the program; 
however, some (such as {opt by}) will cause major problems 
and some should not be used. Use these at your own risk!{p_end}


{title:Other Information}
{* $Id$ }
{phang}Author: Keith Kranker{p_end}

{phang}$Date${p_end}


{title:Examples}

{phang}{cmd:. sysuse lifeexp, clear }{p_end}
{phang}{cmd:. gen loggnp = log10(gnppc)}{p_end}
{phang}{cmd:. label var loggnp "Log base 10 of GNP per capita"}{p_end}
{phang}{cmd:. tempname example1 example2}{p_end}

{phang}{cmd:. scatter_hist lexp loggnp , name(`example1')}{p_end}
{phang}{cmd:. scatter_hist lexp loggnp , percent color(dkorange) m(s) msize(small) xtitle("GNP per capita (log)") name(`example2')}{p_end}

	  {it:({stata scatter_hist_example:click to run})}

{title:Also see}

{psee}
Online:  {helpb twoway scatter}, {helpb twoway histogram}, {helpb graph combine}
