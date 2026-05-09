-- =============================================================
-- Calibre Library Overhaul — PostgreSQL Schema
-- Version: 1.0
-- Description: Core schema for the project.
-- =============================================================

-- Extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";


-- =============================================================
-- GENRES
-- Controlled vocabulary of genres and subgenres.
-- Parent/child hierarchy via self-referencing parent_id.
-- User-controlled list via is_active flag.
-- =============================================================

CREATE TABLE genres (
    genre_id        SERIAL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    genre_code      CHAR(3) NOT NULL,
    parent_id       INTEGER REFERENCES genres(genre_id),
    is_active       BOOLEAN NOT NULL DEFAULT true,
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_genre_name UNIQUE (name),
    CONSTRAINT uq_genre_code UNIQUE (genre_code)
);


-- =============================================================
-- AUTHORS
-- Normalized author records. One row per unique author.
-- Full name broken into parts for sorting and display.
-- =============================================================

CREATE TABLE authors (
    author_id       SERIAL PRIMARY KEY,
    first_name      VARCHAR(100),
    last_name       VARCHAR(100) NOT NULL,
    full_name       VARCHAR(255) NOT NULL,
    bio             TEXT,
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_author_full_name UNIQUE (full_name)
);

CREATE INDEX idx_authors_last_name ON authors(last_name);
CREATE INDEX idx_authors_full_name ON authors(full_name);


-- =============================================================
-- SERIES
-- One row per unique series.
-- Referenced by book_series junction table.
-- =============================================================

CREATE TABLE series (
    series_id       SERIAL PRIMARY KEY,
    name            VARCHAR(500) NOT NULL,
    total_books     SMALLINT,
    is_complete     BOOLEAN,
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_series_name UNIQUE (name)
);

CREATE INDEX idx_series_name ON series(name);


-- =============================================================
-- BOOKS
-- Core table. One row per unique title.
-- Authors, genres, series, and formats all reference this table.
-- =============================================================

CREATE TABLE books (
    book_id             SERIAL PRIMARY KEY,
    title               VARCHAR(500) NOT NULL,
    title_sort          VARCHAR(500),
    subtitle            VARCHAR(500),
    description         TEXT,
    publication_year    SMALLINT,
    language            CHAR(2) NOT NULL DEFAULT 'en',
    page_count          SMALLINT,
    sku                 VARCHAR(50),
    cover_path          VARCHAR(1000),
    calibre_id          INTEGER,
    metadata_quality    SMALLINT DEFAULT 0,
    is_active           BOOLEAN NOT NULL DEFAULT true,
    status              VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at          TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_book_sku UNIQUE (sku),
    CONSTRAINT chk_publication_year CHECK (publication_year > 0),
    CONSTRAINT chk_metadata_quality CHECK (metadata_quality BETWEEN 0 AND 100),
    CONSTRAINT chk_status CHECK (status IN (
        'pending',
        'enriched',
        'sku_assigned',
        'live',
        'flagged'
    ))
);

CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_books_sku ON books(sku);
CREATE INDEX idx_books_status ON books(status);
CREATE INDEX idx_books_language ON books(language);
CREATE INDEX idx_books_metadata_quality ON books(metadata_quality);


-- =============================================================
-- BOOK_AUTHORS
-- Many-to-many between books and authors.
-- is_primary flag identifies the lead author for SKU
-- generation and display purposes.
-- =============================================================

CREATE TABLE book_authors (
    book_id         INTEGER NOT NULL REFERENCES books(book_id),
    author_id       INTEGER NOT NULL REFERENCES authors(author_id),
    is_primary      BOOLEAN NOT NULL DEFAULT false,
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT pk_book_authors PRIMARY KEY (book_id, author_id)
);

CREATE INDEX idx_book_authors_book_id ON book_authors(book_id);
CREATE INDEX idx_book_authors_author_id ON book_authors(author_id);


-- =============================================================
-- BOOK_GENRES
-- Many-to-many between books and genres.
-- is_primary flag identifies the main genre for SKU generation.
-- =============================================================

CREATE TABLE book_genres (
    book_id         INTEGER NOT NULL REFERENCES books(book_id),
    genre_id        INTEGER NOT NULL REFERENCES genres(genre_id),
    is_primary      BOOLEAN NOT NULL DEFAULT false,
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT pk_book_genres PRIMARY KEY (book_id, genre_id)
);

CREATE INDEX idx_book_genres_book_id ON book_genres(book_id);
CREATE INDEX idx_book_genres_genre_id ON book_genres(genre_id);


-- =============================================================
-- BOOK_SERIES
-- Many-to-many between books and series.
-- series_order uses NUMERIC to support companion novels
-- sitting between main entries e.g. 1.5, 2.5
-- =============================================================

CREATE TABLE book_series (
    book_id         INTEGER NOT NULL REFERENCES books(book_id),
    series_id       INTEGER NOT NULL REFERENCES series(series_id),
    series_order    NUMERIC(5,1),
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT pk_book_series PRIMARY KEY (book_id, series_id)
);

CREATE INDEX idx_book_series_book_id ON book_series(book_id);
CREATE INDEX idx_book_series_series_id ON book_series(series_id);


-- =============================================================
-- FORMATS
-- One row per format per book. Three rows per book maximum
-- (epub, mobi, pdf). Stores file path, Proton Drive link,
-- and Pretty Link for each format.
-- =============================================================

CREATE TABLE formats (
    format_id       SERIAL PRIMARY KEY,
    book_id         INTEGER NOT NULL REFERENCES books(book_id),
    format_type     VARCHAR(4) NOT NULL,
    file_name       VARCHAR(500),
    file_path       VARCHAR(1000),
    file_size_mb    NUMERIC(8,2),
    proton_link     VARCHAR(2000),
    pretty_link     VARCHAR(500),
    upload_status   VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_book_format UNIQUE (book_id, format_type),
    CONSTRAINT chk_format_type CHECK (format_type IN (
        'epub',
        'mobi',
        'pdf'
    )),
    CONSTRAINT chk_upload_status CHECK (upload_status IN (
        'pending',
        'uploaded',
        'failed'
    ))
);

CREATE INDEX idx_formats_book_id ON formats(book_id);
CREATE INDEX idx_formats_format_type ON formats(format_type);
CREATE INDEX idx_formats_upload_status ON formats(upload_status);


-- =============================================================
-- BOOK_IDENTIFIERS
-- Stores all external identifiers for a book.
-- One row per identifier type per book.
-- Covers ISBN-10, ISBN-13, Goodreads ID, Google Books ID,
-- and ASIN.
-- =============================================================

CREATE TABLE book_identifiers (
    identifier_id   SERIAL PRIMARY KEY,
    book_id         INTEGER NOT NULL REFERENCES books(book_id),
    identifier_type VARCHAR(20) NOT NULL,
    value           VARCHAR(100) NOT NULL,
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_book_identifier UNIQUE (book_id, identifier_type),
    CONSTRAINT chk_identifier_type CHECK (identifier_type IN (
        'ISBN_10',
        'ISBN_13',
        'GOODREADS_ID',
        'GOOGLE_BOOKS_ID',
        'ASIN'
    ))
);

CREATE INDEX idx_book_identifiers_book_id ON book_identifiers(book_id);
CREATE INDEX idx_book_identifiers_type ON book_identifiers(identifier_type);
CREATE INDEX idx_book_identifiers_value ON book_identifiers(value);


-- =============================================================
-- COVERS
-- One row per book. Stores cover image path and source.
-- Separate from books table to keep core table clean and
-- to track where the cover came from for quality assessment.
-- =============================================================

CREATE TABLE covers (
    cover_id        SERIAL PRIMARY KEY,
    book_id         INTEGER NOT NULL REFERENCES books(book_id),
    file_path       VARCHAR(1000),
    source          VARCHAR(20),
    is_verified     BOOLEAN NOT NULL DEFAULT false,
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_cover_book UNIQUE (book_id),
    CONSTRAINT chk_cover_source CHECK (source IN (
        'calibre',
        'open_library',
        'google_books',
        'manual'
    ))
);

CREATE INDEX idx_covers_book_id ON covers(book_id);
CREATE INDEX idx_covers_source ON covers(source);
CREATE INDEX idx_covers_is_verified ON covers(is_verified);


-- =============================================================
-- INGESTION_LOG
-- One row per pipeline run. Records every batch the pipeline
-- processes — how many books, how long it took, how many
-- were flagged. Operational view of the entire pipeline.
-- =============================================================

CREATE TABLE ingestion_log (
    log_id              SERIAL PRIMARY KEY,
    run_started_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    run_completed_at    TIMESTAMP,
    books_processed     INTEGER DEFAULT 0,
    books_enriched      INTEGER DEFAULT 0,
    books_flagged       INTEGER DEFAULT 0,
    books_failed        INTEGER DEFAULT 0,
    source              VARCHAR(20) NOT NULL DEFAULT 'calibre',
    notes               TEXT,
    status              VARCHAR(20) NOT NULL DEFAULT 'running',

    CONSTRAINT chk_ingestion_status CHECK (status IN (
        'running',
        'completed',
        'completed_with_errors',
        'failed'
    ))
);


-- =============================================================
-- ENRICHMENT_LOG
-- One row per field changed per book during enrichment.
-- Records what changed, what it changed from, what it changed
-- to, and how confident the pipeline was. This is the
-- before/after proof for the portfolio dashboards.
-- =============================================================

CREATE TABLE enrichment_log (
    enrichment_id       SERIAL PRIMARY KEY,
    book_id             INTEGER NOT NULL REFERENCES books(book_id),
    log_id              INTEGER REFERENCES ingestion_log(log_id),
    field_name          VARCHAR(100) NOT NULL,
    old_value           TEXT,
    new_value           TEXT,
    source              VARCHAR(20) NOT NULL,
    confidence_score    NUMERIC(4,3),
    created_at          TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT chk_enrichment_source CHECK (source IN (
        'open_library',
        'google_books',
        'chatgpt',
        'manual'
    )),
    CONSTRAINT chk_confidence CHECK (
        confidence_score BETWEEN 0 AND 1
    )
);

CREATE INDEX idx_enrichment_log_book_id ON enrichment_log(book_id);
CREATE INDEX idx_enrichment_log_field ON enrichment_log(field_name);
CREATE INDEX idx_enrichment_log_source ON enrichment_log(source);
CREATE INDEX idx_enrichment_log_confidence ON enrichment_log(confidence_score);