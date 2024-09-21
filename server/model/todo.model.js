const mongoose = require("mongoose");

const todoSchema = new mongoose.Schema({
  title: { type: String, required: true },
  body: { type: String, required: true }, // Ensure this matches the request
  completed: { type: Boolean, default: false },
});

module.exports = mongoose.model("Todo", todoSchema);
