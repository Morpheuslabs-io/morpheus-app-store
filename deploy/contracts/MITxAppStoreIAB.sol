pragma solidity ^0.4.19;

contract MITxToken {
    mapping (address => mapping (address => uint256)) public allowance;
    function balanceOf (address _owner) public constant returns (uint256);
    function transferFrom(address _from, address _to, uint256 _value) public returns (uint);
}

contract MITxAppStoreIABInterface {
    function division(uint numerator, uint denominator) public constant returns (uint);
    function buy(uint _amount, string _productSku, address _addr_appc, address _dev, address _appstore) public constant returns (bool);
}

contract MITxAppStoreIAB is MITxAppStoreIABInterface {
    uint public dev_share = 80;
    uint public appstore_share = 20;

    event Buy(uint _amount, string _productSku, address _from, address _dev, address _appstore);

    function division(uint numerator, uint denominator) public constant returns (uint) {
        uint _quotient = numerator / denominator;
        return _quotient;
    }

     // call when user purchase an application from the App Store
    function buy(uint256 _amount, string _productSku, address _addr_appc, address _dev, address _appstore) public constant returns (bool) {
        require(_addr_appc != 0x0);
        require(_dev != 0x0);
        require(_appstore != 0x0);

        //Verifies if the contract can spend the needed amount of MITx tokens on behalf of the user
        MITxToken mitx_iab = MITxToken(_addr_appc);
        uint256 aux =  mitx_iab.allowance(msg.sender, address(this));
        require(aux >= _amount);

        uint[] memory amounts = new uint[](3);
        amounts[0] = division(_amount * dev_share, 100);
        amounts[1] = division(_amount * appstore_share, 100);
        //Perform the transactions to the developer and to the ML AppStore 
        //with the respective amounts of MITx tokens by calling the transferFrom of the MITx token smart contract.
        mitx_iab.transferFrom(msg.sender, _dev, amounts[0]);
        mitx_iab.transferFrom(msg.sender, _appstore, amounts[1]);

        Buy(_amount, _productSku, msg.sender, _dev, _appstore);

        return true;
    }
}