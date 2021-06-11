const Todo = artifacts.require('ToDoList');

module.exports = async (deployer) => {
    await deployer.deploy(Todo);
}
