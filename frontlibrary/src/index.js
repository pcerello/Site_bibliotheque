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
import ProfilPage from "./ProfilPage";
import MentionLegal from "./MentionLegal";
import AuthorPage from "./AuthorPage";
import AuthorsPage from "./AuthorsPage";

/**
 * The main entry point of the React application.
 * Configures the router and sets up the routes for the different pages of the app.
 * The root component of the app is rendered using `ReactDOM.createRoot`.
 * @returns {JS.Element} The root element of the React application.
 */
export default function Index() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />} />
        <Route path="/connexion" element={<ConnectionPage />} />
        <Route path="*" element={<ErrorPage />} />
        <Route path="/amis" element={<FriendsPage />} />
        <Route path="/profil" element={<ProfilPage />} />
        <Route path="/books/:id" element={<BookPage />} />
        <Route path="/deconnexion" element={<MyLogoutPage />} />
        <Route path="/mentionLegales" element={<MentionLegal />} />
        <Route path="/auteur/:id" element={<AuthorPage />} />
        <Route path="/auteurs" element={<AuthorsPage />} />
      </Routes>
    </BrowserRouter>
  );
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Index />);
