import React from "react";
import {Link} from "react-router-dom"

function ErrorPage() {
  return (
    <div className="flex flex-col items-center pt-8">
      <h1 className="text-2xl text-color">Erreur 404</h1>
      <p>Page non trouvée</p>
      <Link to={"/"} className="text-center p-3 min-w-[10vw] bg-color text-white m-4" aria-label="Accueil">
            Accueil
      </Link>
    </div>
  );
}
export default ErrorPage;
