const uuid = require("uuid");
const AWS = require("aws-sdk");

const updateTask = async (event) => {
    const dynamodb = new AWS.DynamoDB.DocumentClient();
    const { id } = event.pathParameters;

    const { title, description } = JSON.parse(event.body);

    await dynamodb
      .update({
        TableName: "TaskTable2",
        Key: { id },
        UpdateExpression: "set title = :title, description = :description",
        ExpressionAttributeValues: {
          ":title": title,
          ":description": description,
        },
        ReturnValues: "ALL_NEW",
      })
      .promise();

    return {
      body: JSON.stringify({
        message: "task updated",
      }),
    };
  };

  module.exports = {
    updateTask,
  };