const AWS = require("aws-sdk");

const getTasks = async (event) => {
  const dynamodb = new AWS.DynamoDB.DocumentClient();

  const result = await dynamodb.scan({ 
    TableName: "TaskTable2" }).promise();

  const tasks = result.Items;

  return {
      tasks,
  };
};

module.exports = {
  getTasks,
};