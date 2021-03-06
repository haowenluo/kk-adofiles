*! $Id$

byxtline
Wrapper for "xtline,overlay" that enables the by: prefix.  

This program exists because you aren't allowed to execute 
	by var : xtline .....
This is a workaround.  There's a problem with the legends, but it's a first attempt.

Example: 
bys country : byxtline mortality_rate , i(age) t(t) legend(off)

By Keith Kranker
$Date$

syntax varname [if] [in] , ///
	[ ///
	/// graph combine options
        COLFirst Rows(passthru) Cols(passthru) HOLes(passthru) iscale(passthru) altshrink imargin(passthru) ///
        YCOMmon XCOMmon ///
        commonscheme  scheme(passthru) ///
		TItle(passthru) SUBtitle(passthru) note(passthru) CAPtion(passthru) ///
		YSIZe(passthru) XSIZe(passthru) GRAPHRegion(passthru) PLOTRegion(passthru) ///
        nodraw name(passthru) saving(passthru) ///
	/// xtline options (overlay) is always on
		*     /// all other options passed to xtline ... , overlay                                                                           ///
	 ]  
