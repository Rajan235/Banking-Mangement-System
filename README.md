# Bank Management RDBMS

## Overview

The **Bank Management Relational Database Management System (RDBMS)** is a PostgreSQL-based project designed to efficiently manage various banking operations and data. This system encompasses functionalities for managing customers, accounts, transactions, loans, and related banking services, providing a structured approach to handle the complexity of banking data.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [1. Create Schema](#1-create-schema)
  - [2. Insert Data](#2-insert-data)
  - [3. Create Triggers, Procedures, Views, and Functions](#3-create-triggers-procedures-views-and-functions)
- [Directory Structure](#directory-structure)
- [File Descriptions](#file-descriptions)
- [ERD Diagrams](#erd-diagrams)
- [License](#license)

## Prerequisites

Before setting up the project, ensure you have the following installed:

- [PostgreSQL](https://www.postgresql.org/download/) (version X.X or later)

## Setup Instructions

Follow these steps to set up the Bank Management RDBMS:

### 1. Create Schema

To establish the database schema, execute the following SQL files in order:

1. **Create Tables**:

   - Execute `creating_schema.sql` from the `/schema` directory.

2. **Add Constraints**:

   - Execute `02_create_constraints.sql` from the `/schema` directory to add necessary constraints (e.g., foreign keys).

3. **Create Indexes**:
   - Execute `03_create_indexes.sql` from the `/schema` directory to improve query performance.

### 2. Insert Data

To populate the database with initial data, execute the following SQL file:

- Execute `insert_data.sql` from the `/data` directory to insert sample data into the tables.

### 3. Create Triggers, Procedures, Views, and Functions

Enhance the functionality of your database by executing the following SQL files:

#### Triggers

Run the following files from the `/triggers` directory:

- `enforce_balance_constraint.sql`
- `log_account_changes.sql`
- `log_transaction.sql`
- `update_account_timestamp.sql`
- `update_customer_timestamp.sql`
- `update_employee_timestamp.sql`
- `update_loan_status.sql`

#### Procedures

Run the following files from the `/procedures` directory:

- `create_account_procedures.sql`
- `create_branch_procedures.sql`
- `create_card_procedures.sql`
- `create_customer_procedures.sql`
- `create_employee_procedures.sql`
- `create_loan_procedures.sql`
- `create_payment_procedures.sql`
- `create_service_procedures.sql`
- `create_transaction_procedures.sql`

#### Views

Run the following files from the `/views` directory:

- `account_views.sql`
- `customer_views.sql`
- `employee_views.sql`
- `loan_views.sql`
- `transaction_views.sql`

#### Functions

Run the following files from the `/functions` directory:

- `account_functions.sql`
- `customer_functions.sql`
- `employee_functions.sql`
- `loan_functions.sql`
- `transaction_functions.sql`

## Directory Structure

The project directory is organized as follows:

- `/schema`: Contains SQL files for creating tables, constraints, and indexes.
- `/data`: Contains SQL files for inserting initial data into the tables.
- `/triggers`: Contains SQL files for creating triggers.
- `/procedures`: Contains SQL files for creating stored procedures.
- `/views`: Contains SQL files for creating views.
- `/functions`: Contains SQL files for creating functions.

## File Descriptions

- **creating_schema.sql**: Contains the SQL commands to create all the required tables for the database.
- **02_create_constraints.sql**: Adds necessary constraints, including foreign keys, to ensure data integrity.
- **03_create_indexes.sql**: Creates indexes to optimize performance for frequent queries.
- **insert_data.sql**: Inserts initial sample data into various tables, such as `Customers`, `Accounts`, etc.
- **Triggers**: Automate certain actions in the database (e.g., logging changes, enforcing constraints).
- **Procedures**: Defines stored procedures for performing common operations related to accounts, customers, loans, etc.
- **Functions**: Contains custom functions for specific calculations and operations relevant to banking processes.
- **Views**: Establishes views for simplified data retrieval across different entities.

## ERD Diagrams

The project includes Entity-Relationship Diagrams (ERD) that visually represent the database structure and relationships between entities. These diagrams can be found in the `/erd` directory, specifically in the `output.pdf` file.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
