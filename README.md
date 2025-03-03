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
`prior_prob`: Represents the SAS data file name of the proportion component $P(X_i=j)$ in the finite mixture model generated from a multinomial distribution. It should be a one-row data file.\
`posterior_prob`: Indicates the SAS data file name of the group membership for each subject $P(X_i=j|\boldsymbol{Y_i})$ after fitting the finite mixture model.\
`assign_prob`: Represents the SAS data file name of the assignment probability based on the determined group membership, $P(W_i=j|\boldsymbol{Y_i})$.

### R Functions
The R function enables the BCH adjustment: 
[R BCH](https://github.com/xwytracy/BCH/blob/main/R/function_BCH.R).\
The R function requires a list as input. This list should include the following elements:\
`px`: The prior probability for group assignment.\
`post`: The posterior probability representing each subject's group membership.\
`modal_lc`: The assignment probability based on the most likely group membership.

## References
- Bolck, Annabel, Marcel Croon, and Jacques Hagenaars (2004). “Estimating Latent Structure Models with Categorical Variables: One-Step Versus Three-Step Estimators”. en. In: Political Analysis 12.1, pp. 3–27. issn: 1047-1987, 1476-4989. doi: 10.1093/pan/mph001.
- Vermunt, Jeroen K. (2010). “Latent Class Modeling with Covariates: Two Improved Three-Step Approaches”. en. In: Political Analysis 18.4, pp. 450–469. issn: 1047-1987, 1476-4989. doi: 10.1093/pan/mpq025.
- Bakk, Zsuzsa, Fetene B. Tekle, and Jeroen K. Vermunt (Aug. 2013). “Estimating the Association between Latent Class Membership and External Variables Using Bias-adjusted Three-step Approaches”. en. In: Sociological Methodology 43.1, pp. 272–311. issn: 0081-1750, 1467-9531. doi: 10.1177/0081175012470644.
