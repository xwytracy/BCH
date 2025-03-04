
%macro BCH(prior_prob,posterior_prob,assign_prob,out);
/******Initiate local variable******/
/*sample: number of subjects*/
/*dsid: posterior data*/
%local sample;%local dsid;
%let dsid=%sysfunc(open(&posterior_prob.));
%let sample=%sysfunc(attrn(&dsid,nlobs));
%let dsid=%sysfunc(close(&dsid));

%put sample has &sample. obs. ;

/******Calculate misclassification error matrix and generate subject weights to be used in the secondary model******/
/*w_st: misclassification error matrix*/
/*w_it_star: subject weights*/
proc iml;
 	use &prior_prob.; 	read all var _num_ into pi ; 
	use &assign_prob.; 	read all var _num_ into w_is;
	use &posterior_prob.; 	read all var _num_ into w_it;
  	pi=diag(pi);  inv_pi=inv(pi); 
	w_st = w_is`*w_it *inv_pi/&sample.;
 	d_star=inv(w_st);
 	w_it_star=w_is*d_star`; 
	create w_st 	from w_st; 	append from w_st; 	close w_st;
 	create &out. 	from w_it_star; append from w_it_star; 	close w_it_star; 
quit;

%mend BCH;

%BCH(prior_prob=prior_bch(obs=1),posterior_prob=post_bch,assign_prob=w_is,out=w_it_star_p);
%BCH(prior_prob=prior_bch(obs=1),posterior_prob=post_bch,assign_prob=w_is_modal,out=w_it_star_m);
