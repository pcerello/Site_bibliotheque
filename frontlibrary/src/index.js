import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
import { BrowserRouter } from "react-router-dom";
import { Routes, Route } from "react-router-dom";
import ConnectionPage from "./ConnectionPage";
import ErrorPage from "./ErrorPage";
import FriendsPage from "./FriendsPage";
import BookPage from "./BookPage";
import MyLogoutPage from "./MyLogoutPage";

export default function Index() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />} />
        <Route path="/connexion" element={<ConnectionPage />} />
        <Route path="*" element={<ErrorPage />} />
        <Route path="/amis" element={<FriendsPage />} />
        <Route path="/books/:id" element={<BookPage />} />
        <Route path="/deconnexion" element={<MyLogoutPage />} />
      </Routes>
    </BrowserRouter>
  );
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Index />);
