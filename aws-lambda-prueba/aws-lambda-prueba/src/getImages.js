const AWS = require("aws-sdk");

const getImages = async (event) => {
  const dynamodb = new AWS.DynamoDB.DocumentClient();

  const { id } = event.pathParameters;

  const result = await dynamodb
    .get({
      TableName: "ImageTable",
      Key: { id },
    })
    .promise();

  const image = result.Item

  return {
    body: image,
  };
};

module.exports = {
  getImages,
};