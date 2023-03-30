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
        <Route path="/mention_legales" element={<MentionLegal />} />
        <Route path="/auteur/:id" element={<AuthorPage />} />
        <Route path="/auteurs" element={<AuthorsPage />} />
      </Routes>
    </BrowserRouter>
  );
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Index />);
