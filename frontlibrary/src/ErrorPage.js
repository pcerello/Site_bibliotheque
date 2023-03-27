import React from "react";
import { Link } from "react-router-dom";

function ErrorPage() {
  return (
    <div>
      <h1>Page non trouvée</h1>
      <Link to="/">Retour à l'accueil</Link>
    </div>
  );
}
export default ErrorPage;
