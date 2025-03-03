bch_nocov=function(posterior){
  n=nrow(posterior$post)
  lc=ncol(posterior$post)
  w_is_prop=posterior$post
  modal=as.factor(posterior$modal_lc)
  levels(modal)=c(levels(modal),1:length(posterior$px))
  
  modal=factor(modal, levels =1:length(posterior$px), ordered =TRUE) 
  w_is_modal=model.matrix(~-1+modal,data=modal)
  
  (Class_err_modal_nocov_=Class_err_modal_nocov=(t(w_is_modal)%*% posterior$post)/n)
  (Class_err_prop_nocov_=Class_err_prop_nocov=(t(w_is_prop)%*%  posterior$post)/n)
  
  for (i.col in 1:lc) {
    Class_err_modal_nocov_[,i.col]=Class_err_modal_nocov[,i.col]/posterior$px[i.col]
    Class_err_prop_nocov_[,i.col]=Class_err_prop_nocov[,i.col]/posterior$px[i.col]
  }
  
  Class_err_modal_nocov=Class_err_modal_nocov_
  Class_err_prop_nocov=Class_err_prop_nocov_
  #d_st_modal_nocov=ginv(Class_err_modal_nocov)
  try(d_st_modal_nocov<-inv(Class_err_modal_nocov),silent = T)
  if (exists("d_st_modal_nocov")==F) {
    d_st_modal_nocov<-ginv(Class_err_modal_nocov)
  }
  w_it_modal_nocov=(w_is_modal)%*% t(d_st_modal_nocov)
  
  try( d_st_prop_nocov<-inv(Class_err_prop_nocov),silent = T)
  
  if (exists("d_st_prop_nocov")==F) {
    d_st_prop_nocov<-ginv(Class_err_prop_nocov)
  }
  w_it_prop_nocov=(posterior$post)%*%t( d_st_prop_nocov)
  return(list(w_it_prop_nocov=w_it_prop_nocov,w_it_modal_nocov=w_it_modal_nocov,
              w_st_prop=Class_err_prop_nocov,w_st_modal=Class_err_modal_nocov))
}
