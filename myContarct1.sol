pragma solidity >=0.4.22<0.7.1 ;
contract MyContract{
address owner; 
string name; 
bool visible; 
uint16 count;
constructor()public {
    owner=msg.sender;
}
  function ChangeName(string memory _name) public returns(string memory){ 
      if(msg.sender==owner){
          name=_name;
          return "success" ;
          
      }else{
             return "access denied";
      }
  }

  function ShowName() view public returns(string memory){
       return name;
  }
  
      }