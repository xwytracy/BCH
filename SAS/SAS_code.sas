
%let dsid=%sysfunc(open(posterior));
%let sample=%sysfunc(attrn(&dsid,nlobs));
%let dsid=%sysfunc(close(&dsid));

%put sample has &sample. obs. ;

proc iml;
 	use prior; 	read all var _num_ into pi ; 
	use w_is; 				read all var _num_ into w_is;
  use posterior; 			read all var _num_ into w_it;
  pi=diag(pi);  inv_pi=inv(pi); *print pi; 
	w_st_1 = w_is`*w_it *inv_pi; 
	w_st=w_st_1/&sample.;
 	d_star=inv(w_st);
 	w_it_star=w_is*d_star`;
	create w_st 		from w_st; 		append from w_st; 		close w_st;
 	create w_it_star 	from w_it_star; append from w_it_star; 	close w_it_star;
quit;
