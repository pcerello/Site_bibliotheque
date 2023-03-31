import React, { useMemo } from "react";
import defaultImage from "./livre.png";
import { Link } from "react-router-dom";

/**
 * This function represents the component that displays a book.
 * @param {*} props  the book to display
 * @returns JS Element
 */
function Book(props) {
  const book = useMemo(() => props.book[0], [props.book]); // book to display
  const titleLimit = 20; // limit of characters for the title
  const resumeLimit = 50; // limit of characters for the resume

  return (
    <Link
      to={`/books/${book.id}`}
      arial-label={`Lire plus sur le livre ${book.title}`}
      className="bg-white p-3 drop-shadow-lg ease-out duration-150 hover:scale-110 hover:z-10 md:w-[18vw] mx-4 mt-4"
    >
      <li
        key={book.id}
        role="listitem"
        className=" flex flex-col md:flex-row text-left "
      >
        {book.picture ? ( // if the book has a picture
          <img
            src={`${book.picture}`}
            alt={book.title}
            title={`${book.title}`}
            className="object-cover  w-[100%] md:object-contain drop-shadow-md"
          />
        ) : (
          // if the book has no picture
          <img
            src={defaultImage}
            alt="default"
            style={{ width: "128px" }}
            title={`${book.title}`}
          />
        )}
        <div className="ml-4 flex flex-col justify-between">
          <h3 className="text-lg font-medium">
            {book.title.length > titleLimit
              ? book.title.substring(0, titleLimit) + "..." // if the title is too long
              : book.title}
          </h3>
          <p className="text-gray-300 text-sm">
            {book.nameAuthor ? book.nameAuthor : "auteur inconnu"} - // if the
            author is unknown
            {book.year}
          </p>
          <p className="text-gray-600 mt-2">
            {book.resume.length > resumeLimit
              ? book.resume.substring(0, resumeLimit) + "..." // if the resume is too long
              : book.resume}
          </p>
        </div>
      </li>
    </Link>
  );
}

export default Book;
