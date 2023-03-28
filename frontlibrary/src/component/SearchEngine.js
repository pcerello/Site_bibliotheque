import React, { useState, useRef } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import AuthorBooks from "./AuthorBooks";
import MyHomePage from "./MyHomePage";
import App from "../App";

function SearchEngine() {
  const [authorName, setAuthorName] = useState("");
  const [suggestedAuthors, setSuggestedAuthors] = useState([]);
  const [selectedAuthor, setSelectedAuthor] = useState(null);
  const formRef = useRef(null);

  const handleChange = (event) => {
    const value = event.target.value;
    setAuthorName(value);
    if (value) {
      fetch(`http://localhost:8000/api/authors?name=${value}&max=5`, {
        mode: "cors",
      })
        .then((response) => response.json())
        .then((data) => {
          setSuggestedAuthors(data);
          console.log("data", data);
        });
    } else {
      setSuggestedAuthors([]);
    }
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    setSelectedAuthor(authorName);
  };

  const handleAuthorClick = (author) => {
    setSelectedAuthor(author.id);
  };

  const handleClickOutside = (event) => {
    if (formRef.current && !formRef.current.contains(event.target)) {
      setSuggestedAuthors([]);
    }
  };

  return (
    <div onClick={handleClickOutside}>
      {selectedAuthor ? (
        <App authorId={selectedAuthor} />
      ) : (
        <form className="bg-sky-800 pt-16 pb-16" onSubmit={handleSubmit} ref={formRef}>
          <input
            type="text"
            className="p-1 text-color-hover"
            placeholder="Rechercher un auteur"
            value={authorName}
            onChange={handleChange}
          />
          <button
            type="submit"
            className="p-1 px-6 bg-color hover:bg-color-hover text-white"
            onClick={() => setSelectedAuthor(authorName)}
          >
            <FontAwesomeIcon icon="fa-solid fa-magnifying-glass" />
          </button>
          {suggestedAuthors.length > 0 ? (
            <ul className="bg-gray-100 text-gray-800">
              {suggestedAuthors.map((author) => (
                <li
                  key={author.id}
                  onClick={() => handleAuthorClick(author)}
                >
                  {author.name}
                </li>
              ))}
            </ul>
          ) : (
            <div className="bg-gray-100 text-gray-800">
              {authorName && <p>Aucun auteur</p>}
            </div>
          )}
        </form>
      )}
    </div>
  );
}

export default SearchEngine;
