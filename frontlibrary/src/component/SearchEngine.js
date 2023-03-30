import React, { useState, useRef } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useNavigate } from "react-router-dom";

function SearchEngine() {
  const [authorName, setAuthorName] = useState("");
  const [suggestedAuthors, setSuggestedAuthors] = useState([]);
  const [selectedAuthor, setSelectedAuthor] = useState(null);
  const formRef = useRef(null);
  const navigate = useNavigate();

  const handleChange = (event) => {
    const value = event.target.value;
    setAuthorName(value);
    if (value.length >= 4) {
      fetch(`http://localhost:8000/api/authors?name=${value}&max=10`, {
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
    console.log("authorName", authorName);
    
    navigate(`/auteurs`, { state: { authorName } });
  };

  const handleAuthorClick = (author) => {
    setSelectedAuthor(author.id);
  };

  const handleClickOutside = (event) => {
    if (formRef.current && !formRef.current.contains(event.target)) {
      setSuggestedAuthors([]);
    }
  };

  const boldenMatchingCharacters = (name, search) => {
    const regex = new RegExp(`(${search})`, "i");
    const matches = name.match(regex);
    if (matches) {
      return name.split(matches[1]).reduce((acc, curr, index) => {
        if (index !== 0) {
          acc.push(<b key={index}>{matches[1]}</b>);
        }
        acc.push(curr);
        return acc;
      }, []);
    } else {
      return name;
    }
  };

  return (
    <div
      onClick={handleClickOutside}
      className="flex flex-col items-center text-left"
    >
      {selectedAuthor ? (
        navigate(`/auteur/${selectedAuthor}`)
      ) : (
        <form
          className="relative w-fit pt-16 pb-16"
          onSubmit={handleSubmit}
          ref={formRef}
        >
          <input
            id="search-input"
            type="text"
            className="p-1 text-color-hover"
            placeholder="Rechercher un auteur"
            value={authorName}
            onChange={handleChange}
            aria-label="Rechercher un auteur"
          />
          <label htmlFor="search-button" className="sr-only">
            Rechercher
          </label>
          <button
            id="search-button"
            type="submit"
            className="p-1 px-6 bg-color hover:bg-color-hover text-white"
            onClick={handleSubmit}
            arial-label="Rechercher"
          >
            <FontAwesomeIcon icon="fa-solid fa-magnifying-glass"
              alt="Icône de loupe"
            />
          </button>
          {suggestedAuthors.length > 0 ? (
            <ul
              className="bg-gray-100 text-gray-800 absolute inset-x-0 border-[#009999] border-t-2 border-b-2 flex flex-col"
              role="listbox"
              aria-labelledby="Suggestions d'auteurs"
            >
              {suggestedAuthors.map((author) => (
                <button
                  className="border border-1 bg-white p-1"
                  onClick={() => handleAuthorClick(author)}
                  key={author.id}
                >
                  {boldenMatchingCharacters(author.name, authorName)}
                </button>
              ))}
            </ul>
          ) : (
            authorName.length >= 4 && (
              <div className="bg-gray-100 text-gray-800 absolute inset-x-0 border-[#009999] border-t-2 border-b-2">
                <p>Aucun auteur</p>
              </div>
            )
          )}
        </form>
      )}
    </div>
  );
}
export default SearchEngine;
