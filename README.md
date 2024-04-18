# P2P Lending Application

This repository contains the code for a simple peer-to-peer (P2P) lending application built on the Ethereum blockchain. The application allows users to request loans, fund loans, and repay loans.

## Features

- **Loan Request**: Users can request loans by specifying the loan amount, interest rate, and duration.
- **Loan Funding**: Lenders can fund loans requested by borrowers.
- **Loan Repayment**: Borrowers can repay loans, including the principal amount and interest.

## Getting Started

To run the application locally, follow these steps:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/p2p-lending-app.git
   ```

2. Install dependencies:

   ```bash
   cd p2p-lending-app
   npm install
   ```

3. Configure the environment variables:
   
   - Copy the `.env.example` file to `.env` and modify it with your Ethereum provider URL and other necessary configurations.

4. Compile and deploy the smart contract:

   - Make sure you have a local Ethereum network running (e.g., Ganache).
   - Compile the smart contract:
     ```bash
     npx hardhat compile
     ```
   - Deploy the smart contract to your local network:
     ```bash
     npx hardhat run scripts/deploy.js --network localhost
     ```

5. Start the frontend:

   ```bash
   npm start
   ```

6. Open your web browser and navigate to `http://localhost:3000` to view the application.

## Known Issues

- Currently, there are no known issues. Please [report any issues](https://github.com/your-username/p2p-lending-app/issues) you encounter.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork this repository.
2. Create a new branch for your feature or fix: `git checkout -b feature-name`.
3. Make your changes and commit them: `git commit -m "Add new feature"`.
4. Push to your branch: `git push origin feature-name`.
5. Submit a pull request to the `main` branch of this repository.

Please read our [Contribution Guidelines](CONTRIBUTING.md) for more information.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

If you have any questions or suggestions, feel free to [contact us](mailto:tonyshaq11@gmail.com).

```

Replace placeholders like `your-username`, `your-email@example.com`, and `feature-name` with your actual information. Additionally, customize the content to accurately reflect your project's structure, features, and setup instructions.
