
# Demo DevOps Java Project

This project is a simple Java application developed as part of a DevOps technical test. It incorporates modern DevOps practices and tools to automate the Continuous Integration and Continuous Delivery (CI/CD) process, using Terraform and CloudFormation for infrastructure as code (IaC), and it's deployed on AWS EKS.



### Terraform

The project uses Terraform to declaratively define the required infrastructure on AWS. Terraform is structured at a module level, where each module handles a specific aspect of the infrastructure (like networks, EKS clusters, IAM policies, etc.), facilitating the reuse, maintenance, and scalability of the infrastructure code.

- **Modularity**: Each AWS service is managed as a separate module within Terraform, allowing for greater clarity and control over deployed resources.
- **Environments**: Terraform workspaces are used to manage different environments, such as development and production, allowing easy transition and environment-specific variable management through \`tfvars\` files.

### CloudFormation

Although Terraform is the primary tool for infrastructure as code, the project also incorporates CloudFormation for certain aspects that can benefit from AWS's native integration. CloudFormation serves as a complementary layer for configuring resources that are closely tied to AWS services.

## CI/CD with GitHub Actions

The project implements two main GitHub Actions workflows to automate continuous integration and delivery.

### Pull Request (PR) Workflow

- **Objective**: Test code quality and verify compatibility before allowing merges into the main branch.
- **Steps**:
  - Executes automated tests to validate business logic.
  - Performs code quality analysis to ensure best practices are followed.

### CI/CD Workflow

- **Objective**: Automatically deploy the application to AWS EKS after every change in the main branch.
- **Steps**:
  1. **Code Testing**: Re-runs tests to ensure the code in the main branch is robust and reliable.
  2. **AWS Authentication**: Uses AWS credentials and assumes an IAM role via ARN to gain access to necessary resources.
  3. **Docker Image Build**: Builds the Docker image of the application and tags it with the current commit's SHA.
  4. **Upload Image to ECR**: Uploads the built image to an Amazon ECR repository, making it accessible for deployment.
  5. **Deployment on EKS**: Updates the deployment configuration in AWS EKS to use the new image, triggering the pods' update.

## Accessing the Project

The application is publicly published and accessible through:

[Swagger UI](http://afe5588c5943e4321829228949b23da7-382134011.us-west-2.elb.amazonaws.com/api/swagger-ui/index.html)

This link leads to the Swagger interface, where you can explore and test the available API endpoints.

## Prerequisites

- Java Version 17
- Spring Boot 3.0.5
- Maven

## Getting Started

### Prerequisites

- Java Version 17
- Spring Boot 3.0.5
- Maven

### Installation

Clone this repo.

```bash
git clone https://bitbucket.org/devsu/demo-devops-java.git
```

### Database

The database is generated as a file in the main path when the project is first run, and its name is `test.mv.db`.

Consider giving access permissions to the file for proper functioning.

## Usage

To run tests you can use this command.

```bash
mvn clean test
```

To run locally the project you can use this command.

```bash
mvn spring-boot:run
```

Open http://127.0.0.1:8000/api/swagger-ui.html with your browser to see the result.

### Features

These services can perform,

#### Create User

To create a user, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: POST
```

```json
{
    "dni": "dni",
    "name": "name"
}
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "errors": [
        "error"
    ]
}
```

#### Get Users

To get all users, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
[
    {
        "id": 1,
        "dni": "dni",
        "name": "name"
    }
]
```

#### Get User

To get an user, the endpoint **/api/users/<id>** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the user id does not exist, we will receive status 404 and the following message:

```json
{
    "errors": [
        "User not found: <id>"
    ]
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "errors": [
        "error"
    ]
}
```

# Demo DevOps Java Project

This project is a simple Java application developed as part of a DevOps technical test. It incorporates modern DevOps practices and tools to automate the Continuous Integration and Continuous Delivery (CI/CD) process, using Terraform and CloudFormation for infrastructure as code (IaC), and it's deployed on AWS EKS.

## Architecture and Project Flow

The project follows a CI/CD flow integrated with AWS EKS for deployment and utilizes Terraform and CloudFormation to manage AWS infrastructure efficiently and modularly.

```plaintext
[GitHub Repo]
     |
     | (PR Workflow)
     v
[GitHub Actions] --(PR Check)--> [Code Quality Test]
     |
     | (Merge to Main)
     v
[GitHub Actions] --(CI/CD Workflow)--> [AWS ECR] --(Image)--> [AWS EKS] --> [Kubernetes Pods]
                          |
                         [AWS]
                      /          \
             [Terraform]      [CloudFormation]
