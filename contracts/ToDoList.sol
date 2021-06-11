//SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.8.0;

contract ToDoList{

    
    struct Taskdata{
        uint256  taskId;
        uint256 taskCreationOn;
        string taskName;
        uint256 taskDeadline;
       bool isCompleted;
       bool  ttask;
    }
    //it will map structure
    mapping (uint256 => Taskdata) public tasks;
  
   //set Id
    uint256 taskCounter;
  
    //function to addTask
    function addTask(string memory _taskName,uint256 _due) public returns(bool){
       taskCounter++;
        uint256 deadline = block.timestamp + ( _due*(1 days));
        Taskdata memory task;
        task.taskName = _taskName;
        task.taskId = taskCounter;
        task.taskCreationOn = block.timestamp;
        task.taskDeadline = deadline;
        task.ttask = true;
        tasks[taskCounter] = task;
        return true;
        }
       
       //check Id is exist already or not
       modifier isIdExist(){
       
            require(tasks[taskCounter].ttask == true , "Id not exist" );
            _;
        } 
        
        //function to delete task
    function deleteTask(uint256 _taskId) public isIdExist returns(bool){
       
            delete tasks[_taskId];
        return true;
    }
    //task exist or not
      modifier isExist(){
          require(tasks[taskCounter].isCompleted== false , "This Task does not exist");
            _;
        } 
      //function to set task completed
   function completeTask(uint256 _taskId) public isIdExist isExist returns(bool){
      tasks[_taskId].isCompleted = true;
       return true;
   }
   
 //check task is completed already or not
   modifier taskComplete(){
      // require(tasks[taskCounter].isCompleted== false , "This Task does not exist");
       require(tasks[taskCounter].isCompleted==true,"Task is Completed,you can't update it");
       _;
   }
   //function to update deadline
   function updateDue(uint256 _taskId,uint256 _due)public  taskComplete  returns (uint256){
      return tasks[_taskId].taskDeadline = block.timestamp + ((_due)*(1 days));
        }
     
        
    
    
    
}