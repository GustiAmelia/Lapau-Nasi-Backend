const express = require('express');

const productControllers = require('../Controllers/product');
const uploadImage = require('../Helpers/middleware/uploadImage');

const productRouter = express.Router();

productRouter.post('/',uploadImage.singleUpload,productControllers.postNewProduct)
productRouter.get('/',productControllers.getAllproduct)
productRouter.delete('/',productControllers.deleteProduct)
productRouter.patch('/',uploadImage.singleUpload,productControllers.updateProduct);

module.exports = productRouter;