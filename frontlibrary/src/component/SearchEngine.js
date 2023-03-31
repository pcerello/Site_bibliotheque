import React, { useState, useRef } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useNavigate } from "react-router-dom";

/**
 * This function represents the search engine component.
 * It displays the search engine and the list of suggested authors.
 * @returns JS Element
 */
function SearchEngine() {
  const [authorName, setAuthorName] = useState(""); // The author name entered by the user
  const [suggestedAuthors, setSuggestedAuthors] = useState([]); // The list of suggested authors
  const [selectedAuthor, setSelectedAuthor] = useState(null); // The selected author
  const formRef = useRef(null); // The reference to the form
  const navigate = useNavigate(); // The navigate function

  /**
   * This function handles the change of the input field.
   * It fetches the list of suggested authors from the API.
   * @param {object} event - The event object
   * @returns void
   * @async - This function is asynchronous
   * @function fetch - Fetches the list of suggested authors from the API
   * @function response.json - Converts the response to JSON
   * @function setSuggestedAuthors - Sets the suggested authors to the data returned by the API
   * @function setSuggestedAuthors - Sets the suggested authors to an empty array if the author name is less than 4 characters
   * @function boldenMatchingCharacters - Bolden the matching characters
   */
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
        });
    } else {
      setSuggestedAuthors([]);
    }
  };

  /**
   * This function handles the submit of the form.
   * It navigates to the authors page.
   * @param {object} event - The event object
   * @returns void - This function returns nothing
   * @function navigate - Navigates to the authors page
   */
  const handleSubmit = (event) => {
    event.preventDefault();
    navigate(`/auteurs`, { state: { authorName } });
  };

  /**
   * This function handles the click on an author.
   * It sets the selected author to the id of the author clicked.
   * @param {object} author - The author object
   * @returns void - This function returns nothing
   * @function setSelectedAuthor - Sets the selected author to the id of the author clicked
   */
  const handleAuthorClick = (author) => {
    setSelectedAuthor(author.id);
  };

  /**
   * This function handles the click outside the form.
   * It sets the suggested authors to an empty array.
   * @param {object} event - The event object
   * @returns void - This function returns nothing
   * @function setSuggestedAuthors - Sets the suggested authors to an empty array
   * @function contains - Checks if the form contains the target of the event
   * @function current - The current element
   * @function target - The target of the event
   */
  const handleClickOutside = (event) => {
    if (formRef.current && !formRef.current.contains(event.target)) {
      setSuggestedAuthors([]);
    }
  };

  /**
   * This function boldens the matching characters.
   * @param {string} name - The name of the author
   * @param {string} search - The search term
   * @returns {array} - The array of elements
   * @function new RegExp - Creates a new regular expression
   * @function name.match - Matches the name with the regular expression
   * @function name.split - Splits the name into an array
   * @function reduce - Reduces the array into a single value
   * @function acc.push - Pushes the current value to the accumulator
   * @function key - The key of the element
   * @function matches[1] - The matching characters
   * @function curr - The current value
   */
  const boldenMatchingCharacters = (name, search) => {
    const regex = new RegExp(`(${search})`, "i");
    const matches = name.match(regex);
    if (matches) {
      // If there is a match
      return name.split(matches[1]).reduce((acc, curr, index) => {
        if (index !== 0) {
          acc.push(<b key={index}>{matches[1]}</b>); // Bolden the matching characters
        }
        acc.push(curr);
        return acc;
      }, []);
    } else {
      // If there is no match
      return name;
    }
  };

  return (
    <div
      onClick={handleClickOutside}
      className="flex flex-col items-center text-left"
    >
      {selectedAuthor ? ( // If there is a selected author
        navigate(`/auteur/${selectedAuthor}`) // Navigate to the author page
      ) : (
        <form
          className="relative w-fit pt-16 pb-16"
          onSubmit={handleSubmit} // On submit, call the handleSubmit function
          ref={formRef} // Set the formRef to the form
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
            <FontAwesomeIcon
              icon="fa-solid fa-magnifying-glass"
              alt="Icône de loupe"
            />
          </button>
          {suggestedAuthors.length > 0 ? ( // If there are suggested authors
            <ul
              className="bg-gray-100 text-gray-800 absolute inset-x-0 border-[#009999] border-t-2 border-b-2 flex flex-col"
              role="listbox"
              aria-labelledby="Suggestions d'auteurs"
            >
              {suggestedAuthors.map(
                (
                  author // For each suggested author
                ) => (
                  <button
                    className="border border-1 bg-white p-1"
                    onClick={() => handleAuthorClick(author)}
                    key={author.id}
                  >
                    {boldenMatchingCharacters(author.name, authorName)} //
                    Bolden the matching characters
                  </button>
                )
              )}
            </ul>
          ) : (
            authorName.length >= 4 && ( // If there are no suggested authors and the author name is at least 4 characters
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
