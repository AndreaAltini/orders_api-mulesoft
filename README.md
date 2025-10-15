# orders_api-MuleSoft

**Author:** Andrea Altini - Junior Mulesoft Developer  
**Email:** andrea.altini.3d@gmail.com  
**Location:** Torino, Italy  

---

## Overview

`orders_api` is a MuleSoft application that provides CRUD operations for managing orders. It is implemented using **Mule 4**, **APIkit Router**, and **MUnit tests** to ensure robust functionality and high test coverage.

The project is designed as a portfolio-ready example, demonstrating:

- API implementation using RAML specifications (via MuleSoft Exchange dependency)
- Modular flow design with separated logic
- Full error handling
- Unit tests covering both success and error scenarios

---

## Project Structure

| File | Description |
|------|-------------|
| `orders_api.xml` | Auto-generated APIkit flows connecting the API endpoints to logic flows. Contains: <br>- `orders_api-main` → sets `correlationId`, logs request info, calls APIkit router <br>- `orders_api-console` → console support flow <br>- `get:\orders:orders_api-config` <br>- `get:\orders\(id):orders_api-config` <br>- `post:\orders:application\json:orders_api-config` <br>- `patch:\orders\(id)\status:application\json:orders_api-config` |
| `flows.xml` | Core business logic flows: <br>- `LOGIC_GET-ORDERS` → returns all orders or filtered by query params (limit, offset, cname, status) <br>- `LOGIC_GET-ORDERS-BY-ID` → returns order by ID <br>- `LOGIC_POST-ORDER` → inserts a new order with validations <br>- `LOGIC_PATCH-ORDER-STATUS` → updates order status by ID |
| `global.xml` | Global configurations for HTTP Listener, Database, and Secure Properties |
| `orders-api-test-suite.xml` | MUnit test suite covering both successful scenarios and error cases (DB errors, not found, invalid IDs, etc.) |

**Configuration files:**  
`local.properties`, `dev.properties`, `local.secure.properties`, `dev.secure.properties` (contain database credentials and environment-specific settings).

---

## API Endpoints

The following endpoints are available via the APIkit Router:

- `GET /orders` → Retrieve all orders (supports pagination and filters)
- `GET /orders/{id}` → Retrieve a single order by ID
- `POST /orders` → Create a new order
- `PATCH /orders/{id}/status` → Update the status of an order

Each endpoint delegates the request to the corresponding logic flow in `flows.xml`.

---

## MUnit Test Coverage

The project includes extensive MUnit tests covering both positive and negative scenarios:

| Test Flow | Description |
|-----------|-------------|
| `get-orders-success` | Retrieves a non-empty list of orders |
| `get-orders-empty` | Retrieves an empty list |
| `get-orders-empty-error-db` | Simulates a DB error for GET /orders |
| `get-order-by-id-success` | Retrieves an order by ID |
| `get-order-by-id-not-found` | ID not found error scenario |
| `get-order-by-id-error-db` | Simulates a DB error for GET /orders/{id} |
| `post-order-success` | Creates a new order |
| `post-order-customer-not-found` | Error scenario: customer ID not found |
| `post-order-product-not-found` | Error scenario: product ID not found |
| `post-order-error-insert` | Simulates DB insert error |
| `patch-order-status-success` | Updates order status successfully |
| `patch-order-status-id-not-found` | Error scenario: ID not found |
| `orders-api-main-correlationId-success` | Verifies `correlationId` is set and logged |

**Test Coverage:**  
- Logic flows: 100% (including all error scenarios)  
- APIkit router flow: ~50% (not fully tested, intentionally mocked)  
- Overall estimated coverage: ~70%

---

## Setup Instructions

1. **Clone the repository:**

```bash
git clone https://github.com/your-username/orders_api.git
cd orders_api

