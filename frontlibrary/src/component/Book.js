import React from "react";
import defaultImage from "./livre.png";
import { Link } from "react-router-dom";

class Book extends React.Component {
  /**
   *
   * @returns Constructeur de la classe Book
   */
  constructor(props) {
    super(props);
  }

  render() {
    const book = this.props.book;
    console.log(book);
    return (
      <>
        <li key={book[0].id} className="w-[20vw] flex flex-row text-left">
        {book[0].picture ? ( // Si book.picture existe
          <img src={`${book[0].picture}`} alt={book[0].title} />
        ) : (
          <img src={defaultImage} alt="default" style={{ width: "128px" }} />
        )}
        {book[0].title} - {book.nameAuthor} - {book[0].year}
      </li>
      </>
    );
  }
}
export default Book;
