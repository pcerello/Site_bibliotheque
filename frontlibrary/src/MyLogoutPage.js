import React from "react";
import Layout from "./component/Layout";
import { Link } from "react-router-dom";

function MyLogoutPage() {
  localStorage.removeItem("userId");
  localStorage.removeItem("token");
  return (
    <div className="h-full">
      <Layout>
        <div className="flex flex-col items-center h-[66vh]">
        <h1 className="mt-[20vh] text-2xl">Vous êtes bien déconnectés...</h1>
        <Link to={"/"} className="bg-color text-white p-4 mt-8">
          Retour à l'accueil
        </Link>
        </div>  
      </Layout>
    </div>
  );
}
export default MyLogoutPage;
