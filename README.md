# Orders API - MuleSoft Project

REST API for e-commerce order management built with **MuleSoft Anypoint Studio**.  
Educational project for **MuleSoft Developer Certification** preparation.

**Author:** Andrea Altini - Junior MuleSoft Developer  
**Email:** andrea.altini.3d@gmail.com  
**Location:** Torino, Italy

---

## Index

- [Features](#features)
- [Technologies](#technologies)
- [Project Setup](#project-setup)
- [Configuration](#configuration)
- [Database](#database)
- [API Endpoints](#api-endpoints)
- [Testing](#testing)
- [Project Structure](#project-structure)

---

## Features

- CRUD operations for orders with automatic rollback
- Data validation
- Pagination and filters
- Structured error handling
- Logging with Correlation ID
- Secure properties (encrypted credentials)
- Complete MUnit tests
- RAML-first design

---

## Technologies

- **MuleSoft Anypoint Studio** (version 7.22)
- **MySQL 8.0+**
- **APIKit** for REST routing
- **DataWeave 2.0** for transformations
- **MUnit 3.6.x** for testing
- **Secure Configuration Properties** for security

---

## Project Setup

### 1. Clone the repository

### 2. Import into Anypoint Studio

### 3. Database Setup
import `database/setup.sql` into your MySQL client.

### 4. Configure Properties

#### **Option A: Plain credentials (Fast Option)**

Edit `global.xml` -> `global elements` -> `database config` with your database credential (user/pw).

#### **Option B: Encrypted credentials**

1. Install the encryption tool:
```bash
# Download JAR from MuleSoft
# https://docs.mulesoft.com/mule-runtime/latest/secure-configuration-properties
```

2. Encrypt your credentials:
```bash
java -cp mule-secure-configuration-property-module-1.2.5.jar \
  com.mulesoft.modules.configuration.internal.util.EncryptionTool \
  -m "yourMasterPassword" \
  -v "yourValueToEncrypt"
```

3. Insert encrypted values in `local.secure.properties`

4. Configure **secure.key** at runtime:
   - `Run Configurations` → `Environment`
   - Add new variable:
     secure.key = **YourEncryptionKey**

---

## Configuration

### Environment Variables

Configure these variables to run the project:

| Variable | Description | Example |
|-----------|-------------|---------|
| `secure.key` | Decryption key | `mySecretKey123` |
| `env` | Environment (local/dev) | `local` |

---

## Database

### Schema
```
customers
├── id (PK)
├── first_name
├── last_name
└── email

products
├── id (PK)
├── name
├── category
└── unit_price

orders
├── id (PK)
├── customer_id (FK)
├── status
├── order_date
└── total_amount

order_details
├── id (PK)
├── order_id (FK)
├── product_id (FK)
├── quantity
└── unit_price
```

---

## API Endpoints

Base URI: `http://localhost:8082/api`

### GET /orders

List orders with pagination and filters.

**Query Parameters:**
- `limit` (optional): Number of results (default: 10, max: 100)
- `offset` (optional): Pagination offset (default: 0, min: 0)
- `cname` (optional): Filter by customer name
- `status` (optional): Filter by status (processing/confirmed/shipped/delivered)

**Response 200:**
```json
{
  "orders": [...],
  "pagination": {
    "totalOrders": 100,
    "currentPage": 1,
    "totalPages": 10,
    "limit": 10
  }
}
```

### GET /orders/{id}

Retrieve specific order details.

**Response 200:**
```json
{
  "id": 1,
  "status": "shipped",
  "orderDate": "2025-09-01T10:30:00Z",
  "customer": {...},
  "products": [...],
  "totalAmount": 299.99
}
```

**Response 404:** Order not found

### POST /orders

Create a new order.

**Request Body:**
```json
{
  "customerId": 1,
  "products": [
    {
      "productId": 1,
      "quantity": 2
    }
  ]
}
```

**Response 201:** Order created (returns complete order)

**Response 400:** 
- Customer not found
- Product does not exist

### PATCH /orders/{id}/status

Update order status.

**Request Body:**
```json
{
  "status": "shipped"
}
```

**Response 204:**

**Response 404:** Order not found

---

## Testing

### Run MUnit tests

1. If you are using the Encrypted Database Credential Option, be sure to set the secure.key variable at runtime even for the MUnit tests.

### Included Tests

- GET /orders (success + empty results)
- GET /orders/{id} (success + not found)
- POST /orders (success + customer not found + product not found)
- PATCH /orders/{id}/status (success + not found)
- Database error scenarios
- Correlation ID generation

**Test Coverage:** ~80%
- Business logic flows: 100%
- APIKit router: Not tested (framework code)

---

## Project Structure
```
orders-api/
├── src/
│   ├── main/
│   │   ├── mule/
│   │   │   ├── global.xml              # Global configurations
│   │   │   ├── orders_api.xml          # APIKit router
│   │   │   └── flows.xml               # Business logic flows
│   │   └── resources/
│   │       ├── api/
│   │       │   └── orders_api.raml     # API specification
│   │       ├── examples/               # JSON examples
│   │       ├── local.properties        # Local config
│   │       └── local.secure.properties # Encrypted credentials
│   └── test/
│       └── munit/
│           └── orders-api-test-suite.xml
├── database/
│   └── setup.sql                       # Database script
├── .gitignore
├── pom.xml
└── README.md
```

### Key Files

| File | Description |
|------|-------------|
| `orders_api.xml` | APIKit router and endpoint flows |
| `flows.xml` | Business logic: <br>- `LOGIC_GET-ORDERS` → List/filter orders <br>- `LOGIC_GET-ORDERS-ID` → Get order by ID <br>- `LOGIC_POST-ORDER` → Create order with validations <br>- `LOGIC_PATCH-ORDER-STATUS` → Update status |
| `global.xml` | HTTP Listener, Database, Secure Properties configs |
| `orders-api-test-suite.xml` | MUnit tests (success + error scenarios) |

---

## Learning Outcomes

This project demonstrates:
- RESTful API design with RAML
- MuleSoft flow architecture (separation of concerns)
- Database integration with validation
- Error handling strategies
- Secure configuration management
- Comprehensive unit testing with MUnit
- Logging best practices (Correlation ID)
- DataWeave transformations

---

## License

This project is released under the MIT License.
