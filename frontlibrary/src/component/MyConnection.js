import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

/**
 * This function represents the component that displays the login form.
 * It displays the email and password fields.
 * It displays the login button.
 * It displays the error message if the login or password is incorrect.
 * @returns JS Element
 */
function MyConnection() {
  const [email, setEmail] = useState(""); // email
  const [password, setPassword] = useState(""); // password
  const [error, setError] = useState(false); // error message
  const navigate = useNavigate(); // navigate to another page

  /**
   *  This function handles the login.
   * @param {*} event  the event
   */
  const handleLogin = (event) => {
    event.preventDefault();
    axios
      .post("http://localhost:8000/api/login", {
        email: email,
        password: password,
      })
      .then((response) => {
        localStorage.setItem("token", response.data.user.token); // save the token in the local storage
        localStorage.setItem("userId", response.data.user.id); // save the user id in the local storage
        navigate("/"); // navigate to the home page
      })
      .catch((error) => {
        setError(true); // display the error message
        console.log("Error while logging in: ", error); // display the error in the console
      });
  };

  return (
    <div className="flex flex-col items-center pt-16 min-h-[52vh] bg-white mt-40">
      <form className=" flex flex-col space-y-4" onSubmit={handleLogin}>
        <h1 className="text-2xl">Connexion</h1>
        {error ? ( // if there is an error
          <input
            className="border-2 border-red-300 rounded-sm p-1"
            type="text"
            placeholder="Email"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
          />
        ) : (
          // if there is no error
          <input
            className="border-2 rounded-sm p-1"
            type="text"
            placeholder="Email"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
          />
        )}
        {error ? ( // if there is an error
          <input
            className="border-2 border-red-300 rounded-sm p-1"
            type="password"
            placeholder="Mot de passe"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
          />
        ) : (
          // if there is no error
          <input
            className="border-2 rounded-sm p-1"
            type="password"
            placeholder="Mot de passe"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
          />
        )}
        <button className="bg-color text-white py-2" type="submit">
          Se connecter
        </button>
      </form>
      {error && ( // if there is an error
        <p className="text-red-300 py-2">Login ou mot de passe incorrect</p>
      )}
    </div>
  );
}
export default MyConnection;
