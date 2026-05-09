# Schema Design

## Overview
12-table normalized PostgreSQL schema for the personal digital
library ETL pipeline and analytics platform.

## Tables

| Table | Purpose |
|-------|---------|
| genres | Controlled genre vocabulary with parent/child hierarchy |
| authors | Normalized author records |
| series | Series records with completion tracking |
| books | Core table, one row per unique title |
| book_authors | Books to authors junction with is_primary flag |
| book_genres | Books to genres junction with is_primary flag |
| book_series | Books to series junction with series_order |
| formats | One row per format per book (epub, mobi, pdf) |
| book_identifiers | ISBNs, Goodreads IDs, Google Books IDs, ASINs |
| covers | Cover image paths and source tracking |
| ingestion_log | Pipeline run audit trail |
| enrichment_log | Per-field change log with confidence scores |

## Key Decisions

### Normalization
Authors, genres, and series are fully normalized into their own
tables with junction tables handling the many-to-many relationships.
This allows books to have multiple authors, genres, and series
without duplicating data.

### Primary flags
Both book_authors and book_genres carry an is_primary flag.
The primary author and primary genre are used for SKU generation.
All other authors and genres are stored for search and filtering.

### SKU system
Custom SKU format: LIB-{GENRE_CODE}-{AUTHOR_CODE}-{SEQUENCE}
SKU lives in both the filename and the database.
Genre codes are 3 characters, defined in the genres table.

### Series order
Uses NUMERIC(5,1) to support companion novels and novellas
sitting between main entries e.g. 1.5, 2.5.

### Triple format storage
Each book has up to three rows in the formats table (epub, mobi,
pdf), each with its own file path, Proton Drive link, and Pretty
Link. Supports reading across multiple devices.

### Metadata quality score
Every book carries a metadata_quality score from 0 to 100.
Calculated by the pipeline based on field completeness and
enrichment confidence. Powers the before/after dashboard story.

### Enrichment logging
Every field change made by the pipeline is recorded in
enrichment_log with the old value, new value, source, and
confidence score. This is the audit trail that proves the
data cleaning work for portfolio presentation.

### Language
Stored as a two-character ISO 639-1 code on the books table.
Defaults to 'en'. Simple column rather than a lookup table
given the small number of non-English books in the library.

### Publishers
Intentionally excluded from the initial schema. Calibre's
metadata tools can populate publisher data once titles and
authors are cleaned. Addable via migration later if needed.