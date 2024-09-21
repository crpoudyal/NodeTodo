const Todo = require("../model/todo.model");

// Middleware should be set up in your main server file:
// app.use(express.json());

const getTodos = async (req, res) => {
  try {
    const todos = await Todo.find();
    res.status(200).json(todos);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Create new todo
const createTodo = async (req, res) => {
  try {
    // Destructure and validate required fields from the request body
    const { title, body, isComplete } = req.body;

    // Explicit validation for required fields
    if (!title || !body) {
      return res
        .status(400)
        .json({ message: "Both title and content are required." });
    }

    const todo = new Todo({
      title: title,
      body: body,
      completed: isComplete || false,
    });

    const savedTodo = await todo.save();
    res.status(201).json(savedTodo);
  } catch (error) {
    // Improved logging for detailed error inspection
    console.error("Error creating todo:", error);

    // Send detailed error response for better debugging
    res.status(400).json({ message: error.message });
  }
};

const updateTodo = async (req, res) => {
  try {
    const updatedTodo = await Todo.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });
    if (!updatedTodo)
      return res.status(404).json({ message: "Todo not found" });
    res.status(200).json(updatedTodo);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

const deleteTodo = async (req, res) => {
  try {
    const deletedTodo = await Todo.findByIdAndDelete(req.params.id);
    if (!deletedTodo)
      return res.status(404).json({ message: "Todo not found" });
    res.status(200).json({ message: "Todo deleted" });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getTodos,
  createTodo,
  updateTodo,
  deleteTodo,
};
