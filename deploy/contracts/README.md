# In App Billing Smart contract (MITxAppStoreIAB)

 ## The revenue split feature
 
 The actual example version tests that 80% of a purchase goes to the developer and 20% goes to the Morpheus Labs AppStore (see function buy)
 
 It also stores information in the blockchain about the purchase in the form of an event (event Buy).

 # Verify spending allowence
 Uding allowence it verifies if the contract can spend the needed amount of MITx tokens on behalf of the user and if so, performs the transactions to the developer.