// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ERC_20 {
    string tokenName = "RAJ-Token";
    string tokenSymbol = "RAJ";
    uint8 tokenDecimal = 18;
    uint256 tokenTotalSupply;
    uint256 tokenBalanceOf;
    uint256 tokenAllowance;
 
    //Mapping
    mapping(address => uint256) balances;
    mapping(address=>mapping(address=>uint256)) private myAllowance;

    // Events
    event TransferSuccess(address indexed sender, address indexed receiver, uint256 amount);
    event Approval(address owner, address spender, uint256 value);



    function name() public view returns(string memory) {
        return tokenName;
    }

    function symbol() public view returns(string memory){
        return tokenSymbol;
    }

    function decimals() public view returns(uint8){
        return tokenDecimal;
    }

    function totalSupply() public view returns(uint256){
        return tokenTotalSupply;
    }

    function balanceOf(address _owner) public view returns(uint256 balance){
        require(_owner != address(0), "Owner shouldn't be Address 0");
        return balances[_owner]; 
    }

    function transfer(address _to, uint256 _value) public returns(bool success){
        require(balances[msg.sender] >= _value, "Value must not be greater than your balance");

        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;

        emit TransferSuccess(msg.sender, _to, _value);

        return true;

    }

    function transferFrom(address _from,address _to, uint256 _value) public returns(bool){
        
        require(_from != address(0) && _to != address(0) ,"Address Shouldn't be Address 0");
        require(_value <= myAllowance[_from][msg.sender], "Value must not be more than Allowance");

        myAllowance[_from][msg.sender] = myAllowance[_from][msg.sender] - _value;
        balances[_from] = balances[_from] - _value;
        balances[_to] = balances[_to] + _value;

        emit TransferSuccess(_from, _to, _value);

        return true;


    }

    function approve(address _spender, uint256 _value) public returns(bool){
        require(_spender!= address(0), "Spender should not be address 0");

        myAllowance[msg.sender][_spender] = _value;

    }

    function allowance(address _owner, address _spender) public view returns(uint256){
        return myAllowance[_owner][_spender];
    }


}
