import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function MyConnection() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState(false);
  const navigate = useNavigate();

 
  const handleLogin = (event) => {
    event.preventDefault();
    axios.post("http://localhost:8000/api/login", {
      email: email,
      password: password,
    })
      .then((response) => {
        localStorage.setItem("token", response.data.user.token);
        localStorage.setItem("userId", response.data.user.id);
        navigate('/');
      })
      .catch((error) => {
        setError(true);
        console.log("Error while logging in: ", error);
        
      });
  };

  return (
    <div className="flex flex-col items-center pt-16 min-h-[52vh] bg-white mt-40">
      <form className=" flex flex-col space-y-4" onSubmit={handleLogin}>
        <h1 className="text-2xl">Connexion</h1>
        {error ? (<input
          className="border-2 border-red-300 rounded-sm p-1"
          type="text"
          placeholder="Email"
          value={email}
          onChange={(event) => setEmail(event.target.value)}
        />): (<input
            className="border-2 rounded-sm p-1"
            type="text"
            placeholder="Email"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
          />)}
        {error ?(<input
          className="border-2 border-red-300 rounded-sm p-1"
          type="password"
          placeholder="Mot de passe"
          value={password}
          onChange={(event) => setPassword(event.target.value)}
        />):(<input
            className="border-2 rounded-sm p-1"
            type="password"
            placeholder="Mot de passe"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
          />)}
        <button className="bg-color text-white py-2" type="submit">
          Se connecter
        </button>
      </form>
      {error && <p className="text-red-300 py-2">Login ou mot de passe incorrect</p>}
    </div>
  );
}
export default MyConnection;