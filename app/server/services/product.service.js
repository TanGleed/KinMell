const { product } = require("../models/product.model");

async function createProduct(params, callback) {
  if (!params.productName) {
    return callback(
      {
        message: "Product Name required",
      },
      ""
    );
  }

  if (!params.category) {
    return callback(
      {
        message: "Category required",
      },
      ""
    );
  }

  const productModel = new product(params);
  productModel
    .save()
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function getProducts(params, callback) {
  const productName = params.productName;
  const categoryId = params.categoryId;
  // const userId = params.userId;
  var condition = {};

  if (productName) {
    condition["productName"] = {
      $regex: new RegExp(productName),
      $options: "i",
    };
  }

  if (categoryId) {
    condition["category"] = categoryId;
  }

  //   if (categoryId) {
  //     condition["userId"] = userId;
  //   }

  let perPage = Math.abs(params.pageSize) || process.env.PAGE_SIZE;
  let page = (Math.abs(params.page) || 1) - 1;

  product
    .find(
      condition,
      "productId productName productShortDescription productDescription productPrice productSalePrice productImage productSKU productType stockStatus createdAt updatedAt"
    )
    .sort(params.sort)
    .populate("category", "categoryName categoryImage")
    .limit(perPage)
    .skip(perPage * page)
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function getProductById(params, callback) {
  const productId = params.productId;

  product
    .findById(productId)
    .populate("category", "categoryName categoryImage")
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function updateProduct(params, callback) {
  const productId = params.productId;

  product
    .findByIdAndUpdate(productId, params, { useFindAndModify: false })
    .then((response) => {
      if (!response) {
        callback(`Cannot update product with id ${productId}`);
      } else {
        return callback(null, response);
      }
    })
    .catch((error) => {
      return callback(error);
    });
}

async function deleteProduct(params, callback) {
  const productId = params.productId;

  product
    .findByIdAndRemove(productId)
    .then((response) => {
      if (!response) callback("Not Found Product with Id " + productId);
      else callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

module.exports = {
  createProduct,
  getProducts,
  getProductById,
  updateProduct,
  deleteProduct,
};
