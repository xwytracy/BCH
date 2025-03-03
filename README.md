## Authors

- **Weiyi Xia** 
- **Haiqun Lin** 

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## BCH
This is the R and SAS code to apply the Bolck-Croon-Hagenaars Method to the latent variable model (finite mixture model).


### SAS Macro
The SAS macro enables the BCH adjustment: 
[SAS Macro](https://github.com/xwytracy/BCH/blob/main/SAS/SAS_macro.sas). \
The macro consists of three parameters:\
`prior_prob`: Represents the SAS data file name of the proportion component $P(X_i=j)$ in the finite mixture model generated from a multinomial distribution. It should be a one-row datafile.\
`posterior_prob`: Indicates the SAS data file name of the group membership for each subject $P(X_i=j|\boldsymbol{Y_i})$ after fitting the finite mixture model.\
`assign_prob`: Represents the SAS data file name of the assignment probability based on the determined group membership, $P(W_i=j|\boldsymbol{Y_i})$.

### R Functions
The R function enables the BCH adjustment: 
[R BCH](https://github.com/xwytracy/BCH/blob/main/R/function_BCH.R).\
The R function requires a list as input. This list should include the following elements:\
`px`: The prior probability for group assignment.\
`post`: The posterior probability representing each subject's group membership.\
`modal_lc`: The assignment probability based on the most likely group membership.


