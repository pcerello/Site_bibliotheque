import React, { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import AuthorBooks from "./AuthorBooks";

function SearchEngine() {
  const [authorName, setAuthorName] = useState("");
  const [suggestedAuthors, setSuggestedAuthors] = useState([]);
  const [selectedAuthor, setSelectedAuthor] = useState(null);

  const handleChange = (event) => {
    const value = event.target.value;
    setAuthorName(value);
    fetch(`http://localhost:8000/api/authors?name=${value}&max=5`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setSuggestedAuthors(data);
      });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    setSelectedAuthor(authorName);

  };

  const handleAuthorClick = (author) => {
    setSelectedAuthor(author.name);
  };

  return (
    <div>
      {selectedAuthor ? (
        <AuthorBooks authorName={selectedAuthor} />
      ) : (
        <form className=" pt-16 pb-16" onSubmit={handleSubmit}>
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
          {suggestedAuthors.length > 0 && (
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
          )}
        </form>
      )}
    </div>
  );
}

export default SearchEngine;
