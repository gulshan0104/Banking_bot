import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';

const Dashboard = () => (
  <div className="p-8">
    <h1 className="text-3xl font-bold mb-4">Banking Bot Dashboard</h1>
    <p>Welcome to the Banking Bot Dashboard. Manage your banking data and interact with the AI chatbot.</p>
    <div className="mt-8 grid grid-cols-1 md:grid-cols-3 gap-4">
      <div className="bg-blue-100 p-4 rounded">
        <h2 className="font-bold">Total Accounts</h2>
        <p className="text-2xl">0</p>
      </div>
      <div className="bg-green-100 p-4 rounded">
        <h2 className="font-bold">Total Balance</h2>
        <p className="text-2xl">$0.00</p>
      </div>
      <div className="bg-yellow-100 p-4 rounded">
        <h2 className="font-bold">Recent Transactions</h2>
        <p className="text-2xl">0</p>
      </div>
    </div>
  </div>
);

const Login = () => (
  <div className="flex justify-center items-center h-screen bg-gray-100">
    <div className="bg-white p-8 rounded shadow">
      <h1 className="text-2xl font-bold mb-4">Login</h1>
      <form className="space-y-4">
        <input type="email" placeholder="Email" className="w-full p-2 border rounded" />
        <input type="password" placeholder="Password" className="w-full p-2 border rounded" />
        <button className="w-full bg-blue-500 text-white p-2 rounded">Login</button>
      </form>
    </div>
  </div>
);

const Register = () => (
  <div className="flex justify-center items-center h-screen bg-gray-100">
    <div className="bg-white p-8 rounded shadow">
      <h1 className="text-2xl font-bold mb-4">Register</h1>
      <form className="space-y-4">
        <input type="text" placeholder="Username" className="w-full p-2 border rounded" />
        <input type="email" placeholder="Email" className="w-full p-2 border rounded" />
        <input type="password" placeholder="Password" className="w-full p-2 border rounded" />
        <button className="w-full bg-green-500 text-white p-2 rounded">Register</button>
      </form>
    </div>
  </div>
);

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Dashboard />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
      </Routes>
    </Router>
  );
}

export default App;