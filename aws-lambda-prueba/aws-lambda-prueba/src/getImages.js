const AWS = require("aws-sdk");

const getImages = async (event) => {
  const dynamodb = new AWS.DynamoDB.DocumentClient();

  const result = await dynamodb.scan({ 
    TableName: "ImageTable" }).promise();

  const images = result.Items;

  return {
      images,
  };
};

module.exports = {
  getImages,
};