const express = require("express");
const app = express();

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

const CONTACTS = [
  {
    name: "John Doe",
    email: "john@gmail.com",
    cell: "046-123-4567",
  },
  {
    name: "Pierre Durant",
    email: "pierre@gmail.com",
    cell: "046-123-5678",
  },
  {
    name: "Barbara Renard",
    email: "barbara@gmail.com",
    cell: "046-123-6789",
  },
];

app.get("/contacts", (req, res) => {
  res.json({ contacts: CONTACTS });
});

app.listen(3000, () => {
  console.log("Server running on port 3000.");
});
