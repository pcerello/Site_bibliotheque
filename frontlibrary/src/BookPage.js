import "./App.css";
import BookInfo from "./component/BookInfo";
import Layout from "./component/Layout";

/**
 * This function represents the book page.
 * It displays the book information by calling the BookInfo component.
 * @returns JS Element
 */
function BookPage() {
  return (
    <div className="App">
      <Layout>
        <BookInfo />
      </Layout>
    </div>
  );
}
export default BookPage;
