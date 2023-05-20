import random

def generate_book_data():
    titles = [
        "1984",
        "To Kill a Mockingbird",
        "Pride and Prejudice",
        "The Great Gatsby",
        "Moby-Dick",
        # Add more titles here
    ]
    
    authors = [
        "George Orwell",
        "Harper Lee",
        "Jane Austen",
        "F. Scott Fitzgerald",
        "Herman Melville",
        # Add more authors here
    ]
    
    publishers = [
        "Penguin Books",
        "HarperCollins",
        "Random House",
        "Vintage Books",
        "Simon & Schuster",
        # Add more publishers here
    ]
    
    categories = [
        "Fiction",
        "Mystery",
        "Science Fiction",
        "Romance",
        "Thriller",
        # Add more categories here
    ]
    
    keywords = [
        "Dystopian",
        "Coming of age",
        "Classic",
        "American literature",
        "Adventure",
        # Add more keywords here
    ]
    
    dewey_codes = [
        "800",
        "900",
        "700",
        "600",
        "500",
        # Add more dewey codes here
    ]
    
    for _ in range(100):
        title = random.choice(titles)
        author = random.choice(authors)
        publisher = random.choice(publishers)
        year_published = random.randint(1900, 2022)
        num_pages = random.randint(100, 1000)
        category = random.choice(categories)
        keywords_str = ", ".join(random.sample(keywords, random.randint(1, 5)))
        image_url = "https://example.com/book_image.jpg"
        random_number_1 = random.randint(1, 4)
        random_number_2 = random.randint(1, 10)
        dewey_code = random.choice(dewey_codes)
        
        book_info = f"call Addbook('{title}', '{author}', '{publisher}', {year_published}, {num_pages}, '{category}', '{keywords_str}', '{image_url}', {random_number_1}, {random_number_2}, '{dewey_code}')"
        print(book_info)

# Usage example:
generate_book_data()
