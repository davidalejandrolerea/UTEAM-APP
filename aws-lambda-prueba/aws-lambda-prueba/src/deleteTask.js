const uuid = require("uuid");
const AWS = require("aws-sdk");

const deleteTask = async (event) => {
    const dynamodb = new AWS.DynamoDB.DocumentClient();
    const { id } = event.pathParameters;

    await dynamodb
      .delete({
        TableName: "TaskTable2",
        Key: { id },
      })
      .promise();

    return {
      body: {
        message: "Task deleted",
      },
    };
  };

  module.exports = {
    deleteTask,
  };