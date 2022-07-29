const AWS = require("aws-sdk");

const getTask = async (event) => {
  const dynamodb = new AWS.DynamoDB.DocumentClient();

  const { id } = event.pathParameters;

  const result = await dynamodb
    .get({
      TableName: "TaskTable2",
      Key: { id },
    })
    .promise();

  const task = result.Item

  return {
    body: task,
  };
};

module.exports = {
  getTask,
};