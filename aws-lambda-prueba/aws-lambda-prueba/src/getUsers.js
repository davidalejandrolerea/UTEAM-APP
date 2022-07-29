const AWS = require("aws-sdk");

const getUsers = async (event) => {
  const dynamodb = new AWS.DynamoDB.DocumentClient();

  const result = await dynamodb.scan({ 
    TableName: "UserTable" }).promise();

  const tasks = result.Items;

  return {
      tasks,
  };
};

module.exports = {
  getUsers,
};