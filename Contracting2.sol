pragma solidity >=0.4.22<0.7.1;

contract Contracting{
    uint256 public startDate;
    uint16 public day;
    uint256 public amount=1000 trx;
    uint256 public deposit=100 trx;
    address payable employer;
    address payable contractor;
    address judge;
    
    enum status{notStarted,paid,started,ended,suspended,failed}
    status currentStatus;
    
    constructor(address payable _employer,address payable _contractor,address _judge,uint16 _day) public {
        employer=_employer;
        contractor=_contractor;
        judge=_judge;
        day=_day;
        currentStatus=status.notStarted;
    }
    function Pay()public payable returns(string memory){
        require(currentStatus==status.notStarted);
        require(msg.sender==employer);
        require(msg.value==amount);
        startDate=block.timestamp;
        currentStatus=status.paid;
        return "Success";
    
    }
    
    function Deposit() public payable returns(string memory){
        require(msg.sender==contractor);
        require(msg.value==deposit);
        require(currentStatus==status.paid);
        currentStatus=status.started;
        return "Susccess";
    }
    
    function Confirm(bool verify) public returns(string memory){
          require(msg.sender==employer);
           require(currentStatus==status.started);
           if(verify==true){
               currentStatus=status.ended;
                  return "success";
           }else{
               if(block.timestamp>(day*84600)+startDate){
                   currentStatus=status.suspended;
                   return "success";
               }else{
                   return "deadline is not over";
               }
           }
    }
    
    function Judgment (bool verify) public returns(string memory){
        require(currentStatus==status.suspended);
         require(msg.sender==judge);
         if(verify==true){
             currentStatus=status.ended;
         }else{
             currentStatus=status.failed;
         }
         return "success";
    }
    
    function WithdrawContractor() public payable returns(string memory){
          require(msg.sender==contractor);
           require(currentStatus==status.ended);
           contractor.transfer(1100 trx);
           return "success";
    }
    
        function WithdrawEmployer() public payable returns(string memory){
          require(msg.sender==employer);
           require(currentStatus==status.failed);
           employer.transfer(1100 trx);
           return "success";
    }
}








function Confirm(bool verify) public returns(string memory) {
require(msg.sender=-employer); 
require(currentStatusstatus.started); 
if(verify=true){
     current status=status.ended;
     return "success"; 
     }else{ 
         if(block.timestamp>(day 84600)+startDate) {
    currentStatus=status.Suspended,
    return "success"; }else{
return "deadline is not over";
function Judgment (bool verify) public returns (string memory){
require(currentStatus==status.suspended); require(msg.sender judge); if(verify=true){
current Status=status.ended; }else{
currentStatus=status. failed;
return "success";
function WithdrawContractor() public payable returns (string memory){
require(msg.sender contractor); require(currentStatus==status.ended); contractor.transfer(1100 trx);