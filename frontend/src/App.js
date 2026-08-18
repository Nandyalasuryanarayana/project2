import React, { useState, useEffect } from "react";
import axios from "axios";

function App() {
  const [users, setUsers] = useState([]);
  const [name, setName] = useState("");

  // Function to fetch users
  const fetchUsers = () => {
    axios.get("http://13.201.103.218:5000/api/users")
      .then(res => setUsers(res.data))
      .catch(err => console.error(err));
  };

  // Load users on page load
  useEffect(() => {
    fetchUsers();
  }, []);

  // Add user and refresh list
  const addUser = () => {
    if (!name.trim()) return;
    axios.post("http://13.201.103.218:5000/api/users", { name })
      .then(() => {
        setName("");
        fetchUsers();   // refresh list after adding
      })
      .catch(err => console.error("Add user error:", err));
  };

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>👤 User Management</h1>
      <div style={{ marginBottom: "10px" }}>
        <input
          value={name}
          onChange={e => setName(e.target.value)}
          placeholder="Enter name"
          style={{ padding: "5px", marginRight: "10px" }}
        />
        <button onClick={addUser} style={{ padding: "5px 10px" }}>
          Add User
        </button>
        <button onClick={fetchUsers} style={{ padding: "5px 10px", marginLeft: "10px" }}>
          Refresh
        </button>
      </div>
      <h2>Users List</h2>
      <ul>
        {users.map(u => (
          <li key={u.id}>{u.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;

