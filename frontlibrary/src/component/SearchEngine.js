import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

function SearchEngine() {
  return (
    <form className="bg-sky-800 pt-16 pb-16">
      <input
        type="text"
        className="p-1 text-color-hover"
        placeholder="Rechercher un auteur"
      />
      <button
        type="submit"
        className="p-1 px-6 bg-color hover:bg-color-hover text-white"
      >
        <FontAwesomeIcon icon="fa-solid fa-magnifying-glass" />
      </button>
    </form>
  );
}

export default SearchEngine;
