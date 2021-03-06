{smcl}
{* $Id$ }
{* $Date$}{...}
{cmd:help predlog2}
{hline}

{title:Title}

{p2colset 5 18 20 2}{...}
{p2col:{hi:predlog2 }{hline 2}}Predict log-transformed variables into the 
original metric following a regression on ln(y).  This process is sometimes referred 
to as "Duan Smearing". (An update to {stata findit predlog:predlog}.){p_end}
{p2colreset}{...}

{title:Syntax}

{p 8 18 2}
{cmdab:predlog2}  {ifin}
[, {it:options}]

{synoptset 30 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt d:uan(newvarname)}}Retransformation using Duan's Smearing Factor.{p_end}
{synopt:{opt n:aive(newvarname)}}"Naive" retransformation.{p_end}
{synopt:{opt h:eteroscedastic(newvarname)}}Heteroscedastic smearing retransformation.{p_end}
{synopt:{opt nois:ily}}Display additional output.{p_end}
{synopt:{opt f:predict}}Display additional output.{p_end}
{synopt:{opt s:ave(newvarname)}}Store "smearing estimate."  You will get an error if you select more than one retransformation.{p_end}

{synopt:{opt quad:ratic}}Quadradic prediction for the heteroscedastic retransformation.{p_end}
{synopt:{opt x:vars(varlist)}}Specify RHS variables for the heteroscedastic retransformation.{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}By default, the program generates {it: newvarname(s)} for the sample used in the 
previous regression.  If neither {opt all}, {opt if}, or {opt in} are specified, E(y|x) are 
generated for observations where e(sample)==1.  Users can specify {opt all} if they want to 
create predictions for the entire data set.  Users can also specify the observations 
via {ifin}.  {p_end}
{p 4 6 2}{opt quadratic} and {opt xvars} options only apply to the heteroscadistic transformation; 
  they are ignored if a {it:newvarname} is not provided for {opt hetero()}.  {p_end}
  
{title:Description}

{pstd}
{cmd: predlog2} calculates predicted values in the original metric for a variable that
was log-transformed before estimation.    

{pstd} The program is designed to be run immediately after an OLS regression
where the LHS variable was a log-transformed variable.  See below for an example.
{it: All bets are off if the program is used in different setting}.

{pstd}
{cmd: predlog2} calculates three common solutions to this prediction problem: 
a "{opt naive}" estimate, {opt Duan}'s smearing estimate, and a 
{opt heteroscedastic} estimate. See below for details.

{pstd} The user can select one or more of these estimates by providing a {it:newvarname}
in any of the options.
If no options are specified, the program returns Duan's smearing estimate 
in a variable named {it:y_hat_smear}.  

{pstd}Remember that OLS on ln(y) is not always the best model.  A variety of other models may
be appropriate (for example, a {help glm} model with the link(log) option).
	
{title:Options}

{dlgtab:Main}

{phang}
{opt n:aive(newvarname)} The "Naive" option estimates the simplest retransformation 
by assuming the error term (e) is normally distributed.  

{col 10}  E(Y|X) = exp( xb + .5 (sigma_e)^2 )

{phang}
{opt d:uan(newvarname)}	The "duan" option calculates Duan's Smearing estimate.  
One assumes the error term (e) is not normally distributed, but is i.i.d. or 
exp(e) has constant mean/varience.  See Duan (1983) for details.

{col 10}  E(Y|X) = S exp(xb)    where S = E(exp(e)) = mean[exp(ehat)]

{phang}
{opt h:eteroscedastic(newvarname)}	The "heteroscedastic" option provides a smearing estimate that 
adjusts for heterscedasticity.  One assumes the variance function is function of X 
(a linear function of X by default; see sub-options to change.)  See Manning (1998) 
or Manning & Mullahy (2001) for details. 

{col 10}  E(exp(e)) = f(x)  implies 
{col 10}  E(y|x) = f(x) exp(xb)  , which is equivalent to
{col 10}  ln(E(y|x)) = xb + ln(f(x))
{col 10}  ln(E(y|x)) = xb + 0.5 sigma_e^2 (x) in the log-normal case (assumed here)
{col 20}  (where the last term is the error varience as a function
{col 20}   of {it:X} on the log scale)

{col 10}  What the program does: 
{col 10}   (-)  User has just run OLS: ln(y) = b * x + e
{col 10}   (1)  Save predicted ln(y) from OLS: "bx"
{col 10}   (2)  Save squared residuals from OLS: "ehat^2"
{col 10}   (3)  OLS of "ehat^2" on x (or x & x^2 if {opt quad} or {it:varlist} in {opt xvars})
{col 10}   (4)  Saved predicted values of "ehat^2" from (3): "ehat^2(x)"
{col 10}   (5)  E(y|x) = exp ( bx + .5 ehat^2(x) )

{phang}
{opt n:oisily} displays a few lines from this program to the "results" screen.

{dlgtab:heteroscedastic options}

{phang}
By default, the program predicts the error varience as a {it:linear} function of 
the RHS variables in the existing regression.

{phang}
{opt quad:ratic} Adds {it:quadratic} terms to the default error varience 
function (e.g. x1^2).

{phang}
{opt x:vars(varlist)} Specify RHS variables for error varience function.


{title:Credits}

{pstd}{cmd: predlog2} is an update to the function {stata findit predlog:predlog} 
by Richard Goldstein (STB: STB-29 sg48). The {it:duan} and {it:naive} options 
should produce identical results to {cmd:predlog}, except 
that I have updated the code to work via "modern" Stata code. 

{pstd}The heteroscedastic option is new.

{title:Other Information}
{* $Id$ }
{phang}Author: Keith Kranker{p_end}

{phang}$Date${p_end}

{title:Examples}

    {cmd:. gen log_y = ln(y)}
{phang}{cmd:. reg log_y x1 x2}{p_end}

{phang}{cmd:. predlog2}{p_end}
{phang}{cmd:. predlog2 , duan(pred_y_duan) naive(pred_y_naive) hetero(pred_y_hetero_l)}{p_end}
{phang}{cmd:. predlog2  , h(pred_y_hetero_q) quad}{p_end}
{phang}{cmd:. predlog2  , h(pred_y_hetero_x) x(myvar1 myvar2)}{p_end} 

{title:Also see}

{psee}
STB:  STB-29 sg48

{psee}
Online:  
{helpb predlog},
{help regress},
{help glm}

{psee}
Duan, Naihua (1983). "Smearing Estimate: A Nonparametric Retransformation Method." {it:Journal of the American Statistical Association}. 78 (383): 605-610.

{psee}
Manning, Willard G. (1998). "The logged dependent variable, heteroscedasticity, and the retransformation problem." {it:Journal of Health Economics}. 17 (3): 283-295.

{psee}
Manning, Willard G., and John Mullahy (2001). "Estimating log models: to transform or not to transform?" {it:Journal of Health Economics}. 20 (4): 461-494.

