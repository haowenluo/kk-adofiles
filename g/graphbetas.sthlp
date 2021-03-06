$Id$

HELP FOR graphbetas.ado
Rudimentary program to graph beta coefficients after a regression 

(1) if you specify something for "find" it will only graph the beta cofficients for the 
    variables where a regular expression search for "`find'" in the variable name returns "1".  
(2) if find is not used, it will also clean up variable names beginning with an underscore:
  example: "_Ixxx_10" would be converted to "10"
(3) any other options get passed to the twoway scatteri command

You can specify a matrix besides e(b) (the default), but it must be a row vector

example: 
. xi : reg y i.YEAR x 
. graphbetas , find("_IY")   
. graphbetas , find("eqn1:")        <-- equation name
. graphbetas , find("eqn1:_I.*")    <-- .* is a wildcard 

syntax [name], [ NOConstant Find(string) XTitle(passthru) YTitle(passthru) *]


*! By Keith Kranker
*! $Date$

